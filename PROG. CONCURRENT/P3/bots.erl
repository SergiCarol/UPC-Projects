%%% @author Sebas Vila <sebas@bubinga.upc.es>
%%% @copyright (C) 2012, Sebas Vila
%%% @doc
%%%
%%% @end
%%% Created :  8 Oct 2012 by Sebas Vila <sebas@bubinga.upc.es>
-module(bots).
-include_lib("wx/include/wx.hrl").
-export([start/0,new/2,bots_proc/3]).

start() ->
    wx:new(),
    ok.

new(N,P) ->
    Env=wx:get_env(),
    spawn(?MODULE, bots_proc, [N,P,Env]).

bots_proc(N,P,Env) ->
    wx:set_env(Env),
    Frame = create_window(),
    ButtonLst = create_buttons(Frame,N),
    wxWindow:show(Frame),
    loop(Frame, ButtonLst,P),
    ok.

create_window() ->
    Frame = wxFrame:new(wx:null(), -1, "Botonera"), % window title
    wxFrame:connect(Frame, close_window),
    Frame.

list_of_buttons(_,0) ->
    [];
list_of_buttons(Panel,N) ->
    Blabel = io_lib:format("~B",[N]),
    Btip   = io_lib:format("Planta ~B",[N]),
    B = wxButton:new(Panel, N, [{label,Blabel}]),
    wxButton:setToolTip(B, Btip),
    [B|list_of_buttons(Panel,N-1)].

create_buttons(Panel,N) ->
    Sz = wxBoxSizer:new(?wxVERTICAL),
    SzFlags = [{proportion, 0}, {border, 4}, {flag, ?wxALL}],
    % Get button list and add to sizer
    ButtonLst = list_of_buttons(Panel,N),
    [wxSizer:add(Sz, B, SzFlags) || B <- ButtonLst],
    wxSizer:layout(Sz),
    % connect buttons to events and set background
    wx:foreach(fun (B)-> wxButton:connect(B, command_button_clicked) end, 
	       ButtonLst),
    wx:foreach(fun (B)-> wxButton:setBackgroundColour(B,{246,246,245}) end,
	       ButtonLst),
    % fits the window to the childs
    wxSizer:fit(Sz,Panel),
    ButtonLst.

loop(Frame,ButtonLst,P) ->
    receive 
   	#wx{event=#wxClose{}} ->
   	    io:format("~p Closing window ~n",[self()]),
	    wxWindow:destroy(Frame),
	    P!abort,
	    ok;
   	#wx{id=Id,event=#wxCommand{type=command_button_clicked}} ->
	    P!{clicked,Id},
	    loop(Frame,ButtonLst,P);
	close -> 
	    wxWindow:destroy(Frame),
	    ok;
	{light_on, F} ->
	    B = lists:nth(length(ButtonLst)-F+1,ButtonLst),
	    wxButton:setBackgroundColour(B,{255,255,153}),
	    loop(Frame,ButtonLst,P);
	{light_off, F} ->
	    B = lists:nth(length(ButtonLst)-F+1,ButtonLst),
	    wxButton:setBackgroundColour(B,{246,246,245}), % nullColour
	    loop(Frame,ButtonLst,P);
	Msg ->
	    io:format("Botonera got unknown message ~p ~n", [Msg]),
	    loop(Frame,ButtonLst,P)
    end.


