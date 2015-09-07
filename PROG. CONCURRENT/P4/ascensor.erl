-module(ascensor).
-export([start/0,loop/5]).
%-import(bcab,[new/2,bcab_proc/3]).
%-import(motor,[start/1]).

start() ->
    wx:new(),
    A=bcab:new(4,self()),    
    S=sensor:start(self()),
    M=motor:start(S),    
    loop(A,M,1,1,0).

loop(A,M,PActual,PDesti,R) ->
    receive
	at_top ->
	    M!stop,
	    A!{display,"MAX"},
	    loop(A,M,PActual,PDesti,0);
	at_bottom ->
	    M!stop,
	    A!{display,"MIN"},
	    loop(A,M,PActual,PDesti,0);
	ready ->
	    A!{display,"RESET"},
	    M!run_down,
	    receive
		at_bottom ->
		    M!run_up,
		    receive
			{sens_pl,1} ->
			    M!stop,
			    A!{display,1},
			    A!{light_on,1}
		    end
	    end,
	    loop(A,M,PActual,PDesti,0);
	
	{clicked,N} ->
	    case R==1 of
		true -> loop(A,M,PActual,PDesti,R);
		false -> 
		    A!{light_on,N},
		    A!{light_off,PActual},
		    case N>PActual of
			true -> M!run_up;
			false -> M!run_down
		    end, 
		    loop(A,M,PDesti,N,1)
	    end;
	abort ->
	    M!kill;
	{sens_pl,N} ->
	    A!{display,N},
	    case N==PDesti of
		true -> M!stop,
			A!{light_off,N},
			loop(A,M,N,N,0);
		false -> loop(A,M,PActual,PDesti,1)
	    end
    end.
