-module(cdoors).
-export([start/0,open/0,close/0,kill/0,loop_doors/1]).

-define(OBRIR,4000).
-define(OBERT,10000).
-define(TANCAR,4000).

start()->
    register(doors,spawn(cdoors,loop_doors,[self()])).
    
open()->
    doors!open.   
close()->
    doors!close.
kill()->
    doors!kill.

loop_open(Pid,T,R)->
    case T==R of
	true ->
	    ascensor:doors_open(),
	    loop_opening(Pid);
	false ->
	    receive
		close ->
		    loop_close(Pid,0,T);
		kill ->
		    exit(normal)
	    after
		50 ->
		   loop_open(Pid,T+50,R)
	    end
    end.

loop_opening(Pid)->
    receive 
	close ->
	    io:format("Closing doors ~n"),
	    loop_close(Pid,0,?TANCAR);
	open ->
	    loop_opening(Pid);
	kill ->
	    exit(normal)
    after 
	?OBERT ->
	    loop_close(Pid,0,?TANCAR)
    end.	


loop_close(Pid,T,R) ->
      case T==R of
	true ->
	    ascensor:doors_closed();
	false ->
	    receive
		open ->
		    loop_open(Pid,0,T);
		kill ->
		    exit(normal)
	    after
		50 ->
		   loop_close(Pid,T+50,R)
	    end
    end.


loop_doors(Pid)->
    
    receive 
	open ->
	    loop_open(Pid,0,?OBRIR),
	    loop_doors(Pid);
	close ->
	    loop_close(Pid,0,?TANCAR),
	    loop_doors(Pid);
	kill ->
	    exit(normal)
    end.
	
