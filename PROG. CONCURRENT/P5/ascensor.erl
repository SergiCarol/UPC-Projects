-module(ascensor).
-export([start/0,emergenci/1,ready/0,kill/0,abort/0,sn_post/1,loop/4,pbc_pushed/1,pbp_pushed/2]).

start() ->
    wxenv:start(),
    bppool:start(4),
    bcab:new(4),
    sensor:start(),
    motor:start(), 
    register(ascensor, spawn(ascensor, loop, [1, 1, 0, 1])).

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
    ascensor!open_dors;
pbc_pushed(close_doors) ->
    ascensor!close_dors;
pbc_pushed(N) ->
    ascensor!{clicked,N}.
%%No distingim el valor de les fletxes.
pbp_pushed(Pis,_updown) ->
    ascensor!{arrow,Pis}.
%pbp_pushed(Pis,down) ->
 %   ascensor!{arrow,Pis}.

loop(PActual,PDesti,R,Bpis) ->
    receive
	at_top ->
	    motor:stop(),
	    bcab:display("MAX"),
	    loop(PActual,PDesti,0,Bpis);
	at_bottom ->
	    motor:stop(),
	    bcab:display("MIN"),
	    loop(PActual,PDesti,0,Bpis);
	ready ->
	    bcab:display("RESET"),
	    motor:run(down),
	    receive
		at_bottom ->
		    motor:run(up),
		    receive
			{sens_pl,1} ->
			    motor:stop(),
			    bcab:display(1),
			    bcab:set_light(1, on)
		    end
	    end,
	    loop(PActual,PDesti,0,Bpis);
	
	{clicked,N} ->
	    case R==1 of
		true -> loop(PActual,PDesti,R,Bpis);
		false -> 
		    bcab:set_light(N, on),
		    bcab:set_light(PActual, off),
		    if 
			N>PActual-> 
			    motor:run(up);
			N<PActual->
			    motor:run(down);
			N==PActual->
			    bcab:set_light(PActual, off),
			    loop(PDesti,N,0,Bpis)
		    end, 
		    bppool:display(all,"BUSY"),
		    loop(PDesti,N,1,Bpis)
	    end;
	{arrow,Pis} ->
	    case R==1 of
		true -> loop(PActual,PDesti,R,Bpis);
		false -> 
		    bppool:set_light(Pis,all,on),
		    bcab:set_light(Pis, on),
		    bcab:set_light(PActual, off),
		    if 
			Pis>PActual-> 
			    motor:run(up);
			Pis<PActual->
			    motor:run(down);
			Pis==PActual->
			    bppool:set_light(Pis,all,off),
			    loop(PDesti,Pis,0,Pis)
		    end, 
		    loop(PDesti,Pis,1,Pis)
	    end;
	kill ->
	    bppool:kill(),
	    motor:kill(),
	    bcab:kill(),
	    wxenv:kill();
	abort ->
	    bppool:kill(),
	    motor:kill(),
	    wxenv:kill();
	{sens_pl,N} ->
	    bppool:display(all,"BUSY"),
	    bppool:display(Bpis,N),
	    bcab:display(N),
	    case N==PDesti of
		true -> motor:stop(),
			bppool:display(all,N),
			bppool:display(N,"HERE"),
			bppool:set_light(N,all,off),
			bcab:set_light(N, off),
			loop(N,N,0,Bpis);
		false -> loop(PActual,PDesti,1,Bpis)
	    end
    end.
