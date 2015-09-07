-module(prac0).
-export([compte/1,suprimeix/2, buida/0, empila/2, desempila/1, cim/1]).

compte([])->
    0;
compte([_H|T])->
    1+compte(T).

suprimeix([],_) ->
    [];
suprimeix([A|T],A) ->	
    suprimeix(T,A);
suprimeix([H|T],A) ->
    [H | suprimeix(T,A)].

buida() ->
    [].

empila([],A) ->
    [A];
empila(T,A) ->
    [A]++T.

desempila([_H|T]) ->
    T.

cim([H|_]) ->
    H.
