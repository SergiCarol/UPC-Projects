-module(prac13).
-export([estat/3]).

estat([],1,_) ->
    true;
estat([],undef,_) ->
    false;
estat([],0,_) ->
    false;
estat([H|T],0,{A,B}) ->
    X=B(0,H),
    estat(T,X,{A,B});
estat([_|_],1,{_,_}) ->
    true;
estat([_|_],undef,_) ->
    false.
