-module(ascensor).
-export([start/0,emergenci/1,ready/0,kill/0,abort/0,sn_post/1,loop/5,pbc_pushed/1,pbp_pushed/2,doors_open/0,doors_closed/0,doors_closing/0,doors_opening/0]).

start() ->
    wxenv:start(),
    bppool:start(6),
    bcab:start(),
    cdoors:start(),
    sensor:start(),
    motor:start(),
    register(ascensor, spawn(ascensor, loop, [1, 1, 0, 1, 0])).

emergenci(top) ->
    ascensor!at_top;
emergenci(bottom) ->
    ascensor!at_bottom.
ready() ->
    ascensor!ready.
kill() ->
    ascensor!kill.
abort() ->
    ascensor!abort.
sn_post(P) ->
    ascensor!{sens_pl,P}.
pbc_pushed(open_doors) ->
    ascensor!open_doors;
pbc_pushed(close_doors) ->
    ascensor!close_doors;
pbc_pushed(N) ->
    ascensor!{clicked,N}.
%%No distingim el valor de les fletxes.
pbp_pushed(Pis,_updown) ->
    ascensor!{arrow,Pis}.
%pbp_pushed(Pis,down) ->
 %   ascensor!{arrow,Pis}.
doors_open()->
    ascensor!doors_open.
doors_closed() ->
    ascensor!doors_closed.
doors_closing() ->
    ascensor!doors_closing.
doors_opening() ->
    ascensor!doors_opening.


    
    


loop(PActual,PDesti,R,Bpis,Porta) ->
    receive
	at_top ->
	    motor:stop(),
	    loop(PActual,PDesti,0,Bpis,0);
	at_bottom ->
	    motor:stop(),
	    loop(PActual,PDesti,0,Bpis,0);
	ready ->
	    motor:run(down),
	    receive
		at_bottom ->
		    motor:run(up),
		    receive
			{sens_pl,1} ->
			    motor:stop(),
			    bcab:display(1),
			    bcab:set_light(1, on),
			    bcab:set_light(1, on),
			    cdoors:open(),
			    loop(PActual,PDesti,0,Bpis,1)
		    end
		    
	    end;
	
	{clicked,N} ->
	    case R==1 of
		true -> loop(PActual,PDesti,R,Bpis,0);
		false -> 
		    bcab:set_light(N, on),
		    bcab:set_light(PActual, off),
		    if 
			N>PActual->
			    case Porta == 0 of
				true ->
				    motor:run(up);
				false ->
				    receive 
					doors_closed ->
					    io:format("Doors closed ~n"),
					    motor:run(up)
				    end
			    end;
			N<PActual->
			    case Porta == 0 of
				true ->
				    motor:run(down);
				false ->
				    receive 
					doors_closed ->
					    io:format("Doors closed ~n"),
					    motor:run(down)
				    end
			     end;
			N==PActual->
			    cdoors:open(),
			    io:format("Opening doors ~n"),
			    bcab:set_light(PActual, off),
			    loop(PDesti,N,0,Bpis,Porta)
		    end, 
		    bppool:display(all,"BUSY"),
		    loop(PDesti,N,1,N,0)
	    end;
	{arrow,Pis} ->
	    case R==1 of
		true -> loop(PActual,PDesti,R,Bpis,0);
		false -> 
		    bppool:set_light(Pis,all,on),
		    bcab:set_light(Pis, on),
		    bcab:set_light(PActual, off),
		    if 
			Pis>PActual->			    
			    case Porta == 0 of
				true ->
				    motor:run(up);
				false ->
				    receive 
					doors_closed ->
					    io:format("Doors closed ~n"),
					    motor:run(up)
				    end
			    end;
			Pis<PActual->
			    case Porta == 0 of
				true ->
				    motor:run(down);
				false ->
				    receive 
					doors_closed ->
					    io:format("Doors closed ~n"),
					    motor:run(down)
				    end
			    end;			    
			Pis==PActual->
			    cdoors:open(),
			    io:format("Opening doors ~n"),
			    bppool:set_light(Pis,all,off),
			    loop(PActual,PDesti,0,Bpis,Porta)
		    end, 
		    loop(PDesti,Pis,1,Pis,0)
	    end;
	kill ->
	    cdoors:kill(),
	    bppool:kill(),
	    motor:kill(),
	    bcab:kill(),
	    wxenv:kill();
	abort ->
	    cdoors:kill(),
	    bppool:kill(),
	    motor:kill(),
	    wxenv:kill();
	{sens_pl,N} ->
	    bppool:display(all,"BUSY"),
	    bppool:display(Bpis,(N-1)),
	    bcab:display(N),
	    case N==PDesti of
		true -> motor:stop(),
			bppool:display(all,(N-1)),
			bppool:display(N,"HERE"),
			bppool:set_light(N,all,off),
			bcab:set_light(N, off),
			cdoors:open(),
			bppool:display(N,"OPENING"),
			loop(N,N,0,Bpis,Porta);
		false -> loop(PActual,PDesti,1,Bpis,Porta)
	    end;
	open_doors ->
	    case R==1 of 
		true -> loop(PActual,PDesti,R,Bpis,Porta);
		false -> case Porta==0 of 
			     true -> cdoors:open(),
				     bppool:display(PActual,"OPENING"),
				     loop(PActual,PDesti,R,Bpis,1);
			     false -> cdoors:open(),
				      bppool:display(PActual,"OPEN"),
				      loop(PActual,PDesti,R,Bpis,1)
			 end
	    end;
	close_doors ->
	    case R==1 of 
		true -> loop(PActual,PDesti,R,Bpis,Porta);
		false -> case Porta==1 of 
			     true ->  cdoors:close(),
				      bppool:display(PActual,"CLOSING"),
				      loop(PActual,PDesti,R,Bpis,0);
			     false -> cdoors:close(),
				      bppool:display(PActual,"CLOSED"),
				      loop(PActual,PDesti,R,Bpis,0)
			 end
	    end;
	doors_open ->
	    bppool:display(PActual,"OPEN"),
	    loop(PActual,PDesti,R,Bpis,1);
	doors_opening ->
	    bppool:display(PActual,"OPENING"),
	    loop(PActual,PDesti,R,Bpis,1);
	doors_closing ->
	    bppool:display(PActual,"CLOSING"),
	    loop(PActual,PDesti,R,Bpis,0);
	doors_closed ->
	    bppool:display(PActual,"CLOSED"),
	    loop(PActual,PDesti,R,Bpis,0)
	      
    end.
