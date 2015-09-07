-module(motor).
-export([start/0,run/1,stop/0,kill/0,loop/1]).

-define (RESOL, 0.1).
-define (VELCAB, 0.6).
-define (MAXREC, 22).

start() ->
    sensor:ready(),   
    register(motor, spawn(?MODULE, loop, [0])).

run(up) ->
    motor!run_up;
run(down) ->
    motor!run_down.
stop() ->
    motor!stop.
kill() ->
    motor!kill.

loop(P) ->
    receive
	run_up -> 
	    loop_up(P);
	run_down -> 
	    loop_down(P);
	stop -> 
	    loop(P);			
	kill ->
	    sensor:kill()	
    end.

loop_up(P) ->
    if
	P<?MAXREC ->
	    receive 
		stop -> 
		    loop(P);
		kill ->
		    sensor:kill()
	    after
		100 -> 
		    count_up(P)
	    end;
	P>=?MAXREC ->
	    sensor:emergenci(top),
	    loop(?MAXREC)
    end.

loop_down(P) ->
    if
	P>0 ->
	    receive 
		stop -> 
		    loop(P);
		kill ->
		    sensor:kill()
	    after
		100 -> 
		    count_down(P)
	    end;
	P=<0 ->
	    sensor:emergenci(bottom),
	    loop(0)
    end.

count_up(P) ->
    sensor:post((P+(?VELCAB*?RESOL))),
    loop_up((P+(?VELCAB*?RESOL))).

count_down(P) ->
    sensor:post((P-(?VELCAB*?RESOL))),
    loop_down((P-(?VELCAB*?RESOL))).
