-module(proxy).
-export([new_proxy/2,proxy/3]).
-import(bots,[start/0, new/2, bots_proc/3]).

proxy(Id,N,Proc) ->
    Proxy=spawn(?MODULE, new_proxy, [Proc,Id]),
    bots:new(N, Proxy).

new_proxy(P,IdBot) ->
    receive
	abort ->
	    P!{abort,IdBot};
	{A,B} ->
	    P!{A,B,IdBot}, new_proxy(P,IdBot);
	A ->
	    P!{A,IdBot}, new_proxy(P,IdBot)
    end.
