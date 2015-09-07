-module(prac33).
-export([activa/0,count/2,discount/2,loop/2]).
-import(proxy_pc,[new_proxy/2,proxy/2]).

count(Pid,8) ->
    Pid!{light_on,8};
count(Pid,7) ->
    Pid!{light_on,7};
count(Pid,N) ->
    Pid!{light_on,N},
    count(Pid,N+2).


discount(Pid,7) ->
    Pid!{light_off,7};
discount(Pid,8) ->
    Pid!{light_off,8};
discount(Pid,N) ->
    Pid!{light_off,N},
    discount(Pid,N+2).


loop(PidA,PidB) ->
    receive
	{clicked,N,a}->
	    if N rem 2 =:= 0 ->
		    count(PidB,2),
		    loop(PidA,PidB);
	       N rem 2 =/= 0 ->
		    count(PidB,1),
		    loop(PidA,PidB)
	    end;
	{clicked,N,b} ->
	    if N rem 2 =:= 0 ->
		    discount(PidB,2),
		    loop(PidA,PidB);
	       N rem 2 =/= 0 ->	
		    discount(PidB,1),
		    loop(PidA,PidB)
	    end;
	abort->
	    ok
    end.


activa() ->
    A=proxy_pc:new_proxy(a,2),
    B=proxy_pc:new_proxy(b,8),
    loop(A,B).
