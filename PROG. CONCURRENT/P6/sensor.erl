-module(sensor).
-export([start/0,post/1,emergenci/1,ready/0,kill/0,reset/0,loop/1]).

-define (SENSOR1, 0.5).
-define (SENSOR2, 5.5).
-define (SENSOR3, 8.5).
-define (SENSOR4, 12.5).

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
		(((G=<0.5) and (P>0.5)) or ((P=<0.5) and (G>0.5))) -> ascensor:sn_post(1);
		
		(((G<5.5) and (P>5.5)) or ((P<5.5) and (G>5.5))) -> ascensor:sn_post(2);
		(((G<8.5) and (P>8.5)) or ((P<8.5) and (G>8.5))) -> ascensor:sn_post(3);
		(((G<12.5) and (P>12.5)) or ((P<12.5) and (G>12.5))) -> ascensor:sn_post(4);
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
	    ascensor:sn_post(1),
	    ascensor:ready(),
	    loop(G)
    end.
