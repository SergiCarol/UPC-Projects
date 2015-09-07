-module(prac13_1).
-export([estat/3]).

estat([],3,_) ->
    true;
estat([],_,_) ->
    false;
estat([H|T],_,{A,B}) ->
    X=B(0,H),
    estat(T,X,{A,B});
estat([_|_],3,{_,_}) ->
    true;
estat([_|_],undef,_) ->
    false.
