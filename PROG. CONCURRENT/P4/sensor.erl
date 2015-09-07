-module(sensor).
-export([start/1,loop/2]).

-define (SENSOR1, 0.5).
-define (SENSOR2, 5.5).
-define (SENSOR3, 8.5).
-define (SENSOR4, 12.5).

start(A) ->
    spawn(sensor,loop,[A,0]).

loop(A,G) ->
    receive
	{at,P} ->
	io:format("~w~n",[P]),
	    if
		(((G=<0.5) and (P>0.5)) or ((P=<0.5) and (G>0.5))) -> A!{sens_pl,1};
		
		(((G<5.5) and (P>5.5)) or ((P<5.5) and (G>5.5))) -> A!{sens_pl,2};
		(((G<8.5) and (P>8.5)) or ((P<8.5) and (G>8.5))) -> A!{sens_pl,3};
		(((G<12.5) and (P>12.5)) or ((P<12.5) and (G>12.5))) -> A!{sens_pl,4};
		true -> loop(A,P)									    
	    end,
	    loop(A,P);
	at_top ->
	    A!at_top,
	    loop(A,G);
	at_bottom ->
	    A!at_bottom,
	    loop(A,G);
	ready ->
	    A!ready,
	    loop(A,G);
	kill ->
	    ok;
	reset ->
	    A!at_bottom,
	    A!{sens_pl,1},
	    A!ready,
	    loop(A,G)
    end.
