-module(echo_v2).
-export([loop/0]).

loop() ->
    loop(0, 0).

loop(Echoed, Ignored) ->
    receive
        {echo, Message} ->
            io:format("~p to you too!~n", [Message]),
            loop(Echoed + 1, Ignored);
        info ->
            io:format("Echoed: ~p, ignored: ~p~n", [Echoed, Ignored]),
            loop(Echoed, Ignored);
        Message ->
            io:format("Lol wut: ~p~n", [Message]),
            loop(Echoed, Ignored + 1)
    end.


