-module(prac21).
-export([fold/3]).

fold([],_,I) ->
    I;
fold([H|T],F,I) ->
    C=F(H,I),
    fold(T,F,C).
%Amb la funció fold podem realitzar totes les operacions aritmètiques (suma, resta, multiplicació, divisió)
