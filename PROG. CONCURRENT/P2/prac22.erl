-module(prac22).
-export([parell/1, senar/1, suma/2, duplica/1, predicat/1]).

parell(L) ->
    C=lists:filter(fun(T) -> T rem 2=:=0 end,L),
    lists:foldl(fun(X,Sum) -> X+Sum end,0,C).

senar(L) ->
    suma(L,0).
suma([],_) ->
    0;
suma([H|T],I) ->
    if 
	I rem 2=:=0 ->
	    suma(T,I+1);   
	I rem 2=/=0 ->
	    H+suma(T,I+1)
    end.
	
duplica(L) ->
    C=lists:filter(fun(T) -> T rem 2=:=0 end,L),
    D=C++L,
    lists:sort(D).

predicat(L) ->
    lists:any(fun(T) -> T<0 end,L).
    
