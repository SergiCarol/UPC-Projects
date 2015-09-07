-module(prac03).
-export([buida/0, afegeix/2, treu/2, busca/2]).


buida() ->
    [].

afegeix([],X) ->
    [X];
afegeix([{I,Q,_}|T],{I,Q1,P1}) ->
    [{I,Q+Q1,P1}|T];
afegeix([{I,Q,P}|T],{I2,Q2,P2}) ->
    [{I,Q,P}|afegeix(T,{I2,Q2,P2})].	

treu([],_) ->
    [];
treu([{I,Q,_}|T],{I,Q,_}) ->
    T;
treu([{I,Q,_}|T],{I,Q2,P2}) ->
    [{I,Q-Q2,P2}|T];
treu([{I,Q,P}|T],{I3,Q3,P3}) ->
    [{I,Q,P}|treu(T,{I3,Q3,P3})].

busca([],_) ->
    [];
busca([{I,Q,P}|_],{I,_,_}) ->
    {I,Q,P};
busca([{_,_,_}|T],{I1,Q1,P1}) ->
    [busca(T,{I1,Q1,P1})].


