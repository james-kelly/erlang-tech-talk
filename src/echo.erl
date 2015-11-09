-module(echo).
-export([loop/0]).

loop() ->
    receive
        {echo, _From, Message} ->
            io:format("~p to you too!~n", [Message]);
        Message ->
            io:format("Lol wut: ~p~n", [Message])
    end,
    loop().
