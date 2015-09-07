-module(prac12).
-export([buida/0, empila/2, desempila/1, cim/1, start/0, llista/2]).

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

start() ->
    {_,T,_}= io:scan_erl_exprs('op= '),
    llista(T,buida()).

llista([{'integer',_,X}|T],Y)->	       
    llista(T,empila(Y,X));
llista([{'*',_}|T],Y)->	       
    D=cim(Y),
    E=cim(desempila(Y)),
    llista(T,empila(desempila(Y),D*E));
llista([{'+',_}|T],Y)->	       
    A=cim(Y),
    B=cim(desempila(Y)),
    llista(T,empila(desempila(Y),A+B));
llista([{'dot',_}|_],Y)->
    cim(Y).

