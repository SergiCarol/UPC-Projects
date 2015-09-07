-module(motor).
-export([start/1,loop/2]).

-define (RESOL, 0.1).
-define (VELCAB, 0.6).
-define (MAXREC, 22).

start(Pid) ->
    Pid!ready,
    spawn(motor,loop,[Pid,0]).

loop(Pid,P) ->
    receive
	run_up -> 
	    loop_up(Pid,P);
	run_down -> 
	    loop_down(Pid,P);
	stop -> 
	    loop(Pid,P);			
	kill ->
	    Pid!kill	
    end.

loop_up(Pid,P) ->
    if
	P<?MAXREC ->
	    receive 
		stop -> 
		    loop(Pid,P);
		kill ->
		    Pid!kill
	    after
		100 -> 
		    count_up(Pid,P)
	    end;
	P>=?MAXREC ->
	    Pid!at_top,
	    loop(Pid,?MAXREC)
    end.

loop_down(Pid,P) ->
    if
	P>0 ->
	    receive 
		stop -> 
		    loop(Pid,P);
		kill ->
		    Pid!kill
	    after
		100 -> 
		    count_down(Pid,P)
	    end;
	P=<0 ->
	    Pid!at_bottom,
	    loop(Pid,0)
    end.

count_up(Pid,P) ->
    Pid!{at,(P+(?VELCAB*?RESOL))},
    loop_up(Pid,(P+(?VELCAB*?RESOL))).

count_down(Pid,P) ->
    Pid!{at,(P-(?VELCAB*?RESOL))},
    loop_down(Pid,(P-(?VELCAB*?RESOL))).
