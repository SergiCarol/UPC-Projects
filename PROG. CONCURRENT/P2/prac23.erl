-module(prac23).
-export([start/0, loop/0, calcular/2, calculadora/3, pe/2]).

start() ->
    spawn(prac23,loop,[]).

loop() ->
    receive
	{Pid,A,B} ->
	    Pid!{self(),calcular(A,B)}
    end.

calcular([],[]) ->
    0;
calcular([A|T],[B|C]) ->
    A*B+calcular(T,C).
   
calculadora(A,B,Pid) ->
    Pid!{self(),A,B},
    receive
	{Pid,Resposta} ->
	    Resposta
    end.
     
pe(A,B)->
    {A1,A2}=lists:split(length(A)div 2,A),
    {B1,B2}=lists:split(length(B)div 2,B),
    calculadora(A1,B1,start())+calculadora(A2,B2,start()).
    
    
