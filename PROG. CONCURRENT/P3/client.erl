-module(client).
-export([start/0,loop/2]).
-import(proxy,[proxy/3,new_proxy/2]).

start() ->
    Node = 'servidor@Sergi',
    spawn(Node, servidor1, inici, []),
    bots:start(),
    B = proxy:proxy(control, 2, self()),
    loop(B,Node).

loop(B,Node) ->
    receive
        {abort, _} ->
	    ok;
	
        {clicked,N,control} ->
	    if N rem 2 =:= 0 ->
		    count({servidor,Node},2),
		    loop(B,Node);
	       N rem 2 =/= 0 ->
		    count({servidor,Node},1),
		    loop(B,Node)		  
	    end
    end.

count(Pid,8) ->
    Pid!{light_on,8};
count(Pid,7) ->
    Pid!{light_on,7};
count(Pid,N) ->
    Pid!{light_on,N},
    count(Pid,N+2).
