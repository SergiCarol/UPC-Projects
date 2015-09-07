-module(sensor).
-export([start/0,post/1,emergenci/1,ready/0,kill/0,reset/0,loop/1]).

-define (SENSOR0, 0.5).
-define (SENSOR1, 5.5).
-define (SENSOR2, 8.5).
-define (SENSOR3, 12.5).
-define (SENSOR4, 15.5).
-define (SENSOR5, 18.5).

start() ->
    register(sensor, spawn(?MODULE, loop, [0])).

post(P) ->
    sensor!{at,P}.
emergenci(top) ->
    sensor!at_top;
emergenci(bottom) ->
    sensor!at_bottom.
ready() ->
    sensor!ready.
kill() ->
    sensor!kill.
reset() ->
    sensor!reset.

loop(G) ->
    receive
	{at,P} ->
	io:format("~w~n",[P]),
	    if
		(((G=<?SENSOR0) and (P>?SENSOR0)) or ((P=<?SENSOR0) and (G>?SENSOR0))) -> ascensor:sn_post(0);
		(((G<?SENSOR1) and (P>?SENSOR1)) or ((P<?SENSOR1) and (G>?SENSOR1))) -> ascensor:sn_post(1);
		(((G<?SENSOR2) and (P>?SENSOR2)) or ((P<?SENSOR2) and (G>?SENSOR2))) -> ascensor:sn_post(2);
		(((G<?SENSOR3) and (P>?SENSOR3)) or ((P<?SENSOR3) and (G>?SENSOR3))) -> ascensor:sn_post(3);
		(((G<?SENSOR4) and (P>?SENSOR4)) or ((P<?SENSOR4) and (G>?SENSOR4))) -> ascensor:sn_post(4);
		(((G<?SENSOR5) and (P>?SENSOR5)) or ((P<?SENSOR5) and (G>?SENSOR5))) -> ascensor:sn_post(5);
		true -> loop(P)									    
	    end,
	    loop(P);
	at_top ->
	    ascensor:emergenci(top),
	    loop(G);
	at_bottom ->
	    ascensor:emergenci(bottom),
	    loop(G);
	ready ->
	    ascensor:ready(),
	    loop(G);
	kill ->
	    exit(normal);
	reset ->
	    ascensor:emergenci(bottom),
	    ascensor:sn_post(0),
	    ascensor:ready(),
	    loop(G)
    end.
