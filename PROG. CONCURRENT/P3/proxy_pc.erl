-module(proxy_pc).
-export([new_proxy/2,proxy/2]).
-import(bots,[start/0, new/2, bots_proc/3]).



new_proxy(Nom,N)->
    PidP=spawn(proxy_pc, proxy, [self(),Nom]),
    bots:start(),    
    bots:new(N,PidP).

proxy(PidC,Nom) ->
    receive
	{clicked,N} ->
	    PidC!{clicked,N,Nom},
	    proxy(PidC,Nom);
	abort->
	    PidC!abort
    end.
