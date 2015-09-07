-module(prac11).
-export([xenx/2]).

xenx([],_) ->
    [];
xenx([C],_) ->
    [C];
xenx([C|_],0) ->
    [C];
xenx([C|T],X) ->
    [C]++xenx(lists:sublist(T,X,length(T)),X).
