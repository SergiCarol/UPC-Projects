-module(prac24).
-export([rpc/2, pe/1,start/0,loop/0]).


start()->
    spawn(prac24,loop,[]).

loop() ->
    receive 
    	{Pid,L} ->
	    Pid!{self(),lists:sort(L)}
    end.

rpc(Pid,L) ->
    Pid!{self(),L},
    receive
	{Pid,Resposta} -> 
	    Resposta
    end.

pe(A)->
    {A1,A2}=lists:split(length(A)div 2,A),
    lists:merge((rpc(start(),A1)),rpc(start(),A2)).
