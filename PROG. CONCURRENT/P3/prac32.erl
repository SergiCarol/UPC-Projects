-module(prac32).
-export([activa/0, wait_20/2, wait_5/2, start/1, temps/2]).
-import(bots,[start/0, new/2, bots_proc/3]).

wait_20(Pid,N) ->
    Pid!{light_on,N},
    timer:sleep(5000).
    
wait_5(Pid,N) ->
    Pid!{light_off,N},
    timer:sleep(500),
    Pid!{light_on,N},
    timer:sleep(500),
    Pid!{light_off,N},
    timer:sleep(500),
    Pid!{light_on,N},
    timer:sleep(500),
    Pid!{light_off,N},
    timer:sleep(500),
    Pid!{light_on,N},
    timer:sleep(500),
    Pid!{light_off,N},
    timer:sleep(500),
    Pid!{light_on,N},
    timer:sleep(500),
    Pid!{light_off,N},
    timer:sleep(500),
    Pid!{light_on,N},
    timer:sleep(500),
    Pid!{light_off,N}.

activa() ->
    bots:start(),
    A=bots:new(6,self()),
    start(A).

temps(A,N) ->
    wait_20(A,N),
    wait_5(A,N).

start(A) ->
    receive 
    	{clicked,N} ->
      	    spawn(prac32,temps,[A,N]),
	    	start(A);

	    abort -> 
	    	ok
    end.
