-module(sum).

%% API
-export([sum/1]).

sum(List)->
    sum(List, 0).

sum([], Sum)->
    Sum;
sum([H|T], Sum)->
    sum(T, Sum + H).