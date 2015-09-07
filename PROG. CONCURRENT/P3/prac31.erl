-module(prac31).
-export([activa/0, count/2, discount/2, apaga/2, start/1]).
-import(bots,[start/0, new/2, bots_proc/3]).

count(Pid,10) ->
    Pid!{light_on,10};
count(Pid,N) ->
    Pid!{light_on,N},
    count(Pid,N+1).

discount(Pid,10) ->
    Pid!{light_off,10},
    start(Pid);
discount(Pid,N) ->
    if 
	N=<10 ->
	    Pid!{light_off,N},
	    discount(Pid,N+1)
    end.

activa()->
    bots:start(),
    A=bots:new(10,self()),
    start(A).

start(A) ->
    receive 
    	{clicked,N} ->
	    count(A,N),
	    apaga(A,N);	
	abort ->
	    ok
    end.

apaga(A,N) ->	    
    receive
	{clicked,B} ->
	    if 
		B>=N ->
		    discount(A,N);
		B<N ->
		    apaga(A,N)			
	    end		      
    end.



			
		    


