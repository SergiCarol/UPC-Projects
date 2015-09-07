-module(prac34).
-export([activa/0, loop/3, nova/0, tenca/1]).
-import(proxy_pc,[new_proxy/2,proxy/2]).

activa() ->
    A=proxy_pc:new_proxy(petita,2),
    loop(A,[],[]).
    
loop(A,L,C) ->
    receive
	{clicked,1,petita} ->
	    PidD=nova(),
	    inici(PidD,C),	    
	    loop(A,L++[PidD],C);
	{clicked,2,petita} ->
	    tenca(L),
	    loop(A,L,C);
	{clicked,N,gran} ->
	    case lists:member(N,C) of
		true -> apaga(L,N),
			X=lists:delete(N,C),
			loop(A,L,X);
		false -> encen(L,N),
			 loop(A,L,C++[N])
            end;
	abort ->
	    ok
    end.

inici(_,[]) ->
    ok;
inici(PidD,[C|T]) ->
    PidD!{light_on,C},
    inici(PidD,T).

nova() ->
    proxy_pc:new_proxy(gran,8).

encen([],_) ->
    ok;
encen([H|T],N) ->
    H!{light_on,N},
    encen(T,N).

apaga([],_) ->
    ok;
apaga([H|T],N) ->	    
    H!{light_off,N},
    apaga(T,N).

tenca([]) ->
    ok;
tenca([H|T]) -> 
    H!close,
    tenca(T).
