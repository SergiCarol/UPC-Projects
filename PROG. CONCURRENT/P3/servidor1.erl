-module(servidor1).
-export([inici/0]).

inici() ->
    bots:start(),
    register(servidor, proxy:proxy(pisos, 8, self())),
    loop(servidor).

loop(B) ->
    receive
	{clicked,N,pisos} ->
	    if N rem 2 =:= 0 ->
		    discount(B,2),
		    loop(B);
	       N rem 2 =/= 0 ->	
		    discount(B,1),
		    loop(B)
	    end;
	{abort, _} ->
	    ok
    end.

discount(Pid,7) ->
    Pid!{light_off,7};
discount(Pid,8) ->
    Pid!{light_off,8};
discount(Pid,N) ->
    Pid!{light_off,N},
    discount(Pid,N+2).
