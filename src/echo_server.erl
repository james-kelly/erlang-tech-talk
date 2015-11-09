-module(echo_server).

-behaviour(gen_server).

-export([start_link/0, echo/1, info/0, init/1, handle_call/3]).

-record(state, {echoed = 0}).

start_link() ->
    gen_server:start_link({local, echo_server}, echo_server, [], []).

echo(Message) ->
    gen_server:call(echo_server, {echo, Message}).

info() ->
    gen_server:call(echo_server, info).

init([]) ->
    {ok, #state{}}.

handle_call({echo, Message}, _From, #state{echoed = Echoed} = State) ->
    io:format("~p to you too!~n", [Message]),
    {reply, ok, State#state{echoed = Echoed + 1}};
handle_call(info, _From, State) ->
    io:format("Echoed: ~p~n", [State#state.echoed]),
    {reply, ok, State};
handle_call(_Request, _From, State) ->
    {reply, ok, State}.
