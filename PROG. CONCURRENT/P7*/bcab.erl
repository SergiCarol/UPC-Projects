-module(bcab).
-export([display/1, set_light/2, kill/0, start/0, numero/1, loop/1]).
-define (PORT,"/dev/ttyACM0").

start() ->
    A=open_port(?PORT,[]),
    B=spawn(bcab, loop, [A]),
    port_connect(A, B),
    register(bcab,B).

display(M) ->
    bcab!{display,M}.
set_light(Pis, on) ->
    bcab!{light_on, Pis};
set_light(Pis, off) ->
    bcab!{light_off, Pis}.
kill() ->
    bcab!kill.

loop(A) ->
    receive
	{display,M} ->
	    send_display(A,M),
	    loop(A);
	
	{light_on, Pis} ->
	    send_on(A,Pis),
	    loop(A);
	
	{light_off, Pis} ->
	    send_off(A,Pis),
	    loop(A);
	
	{A, {data, Data}} ->
	    if 
		Data=:="TP\n" ->
		    ascensor:pbc_pushed(close_doors),
		    loop(A);
		Data=:="OP\n" ->
		    ascensor:pbc_pushed(open_doors),
		    loop(A);
		true ->
		    numero(Data),
		    loop(A)
	    end;
	   
	kill ->
	    port_close(A),
	    ok
   end.

%------ FUNCIO DISPLAY ------
send_display(A,1) ->
    port_command(A,"D1");
send_display(A,2)->
    port_command(A,"D2");
send_display(A,3) ->
    port_command(A,"D3");
send_display(A,4) ->
    port_command(A,"D4");
send_display(A,5)->
    port_command(A,"D5");
send_display(A,6) ->
    port_command(A,"D6");
send_display(_,_) ->
    io:format("Not in range~n"),
    ok.
%----------------------------

%------ FUNCIO LIGHT_ON ------
send_on(A,1) ->
    port_command(A,"E1");
send_on(A,2) ->
    port_command(A,"E2");
send_on(A,3) ->
    port_command(A,"E3");
send_on(A,4) ->
    port_command(A,"E4");
send_on(A,5) ->
    port_command(A,"E5");
send_on(A,6) ->
    port_command(A,"E6");
send_on(_,_) ->
    io:format("Not in range~n"),
    ok.
%-----------------------------

%------ FUNCIO LIGHT_OFF ------
send_off(A,1) ->
    port_command(A,"A1");
send_off(A,2) ->
    port_command(A,"A2");
send_off(A,3) ->
    port_command(A,"A3");
send_off(A,4) ->
    port_command(A,"A4");
send_off(A,5) ->
    port_command(A,"A5");
send_off(A,6) ->
    port_command(A,"A6");
send_off(_,_) ->
    io:format("Not in range~n"),
    ok.
%------------------------------

%------FUNCIO NUMERO-----------
numero("B1\n") ->
    ascensor:pbc_pushed(1);
numero("B2\n") ->
    ascensor:pbc_pushed(2);
numero("B3\n") ->
    ascensor:pbc_pushed(3);
numero("B4\n") ->
    ascensor:pbc_pushed(4);
numero("B5\n") ->
    ascensor:pbc_pushed(5);
numero("B6\n") ->
    ascensor:pbc_pushed(6);
numero(_) ->
    ok.
%-------------------------------
