-module(prac14).
-export([estat/3, makeparser/1, paraula/2]).

estat([],1,_) ->
    true;
estat([],undef,_) ->
    false;
estat([],0,_) ->
    false;
estat([H|T],0,{A,B}) ->
    X=B(0,H),
    estat(T,X,{A,B});
estat([_|T],1,{_,_}) ->
    false;
estat([_|_],undef,_) ->
    false.

paraula(S,{A,B}) ->
	estat(S,0,{A,B});
paraula(_,{_,_}) ->
	false.

makeparser(A) ->
   fun (Str) -> paraula(Str,A) end.
	


	
    
