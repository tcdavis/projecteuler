-module(p31).

-export([checkSwap/2]).
-export([startlist/0]).
-export([trySwap/2]).
-export([recurse/2]).
-export([start/0]).

checkSwap(CoinSet, CoinVal) ->
    AllOnes = lists:duplicate(CoinVal, 1),
    Start = lists:sublist(CoinSet, CoinVal),
    if
        AllOnes == Start ->
            true;
        true ->
            false
    end.

trySwap(CoinSet, CoinNum) ->
    Coins = [2, 5, 10, 20, 50, 100, 200],
    SwapOK = checkSwap(CoinSet, lists:nth(CoinNum, Coins)),
    CoinVal = lists:nth(CoinNum, Coins),
    if
       SwapOK ->
            lists:append(lists:nthtail(CoinVal, CoinSet), [CoinVal]);
        true ->
            []
    end.


recurse(CoinSet, CoinNum) ->
    SwapThis = trySwap(CoinSet, CoinNum),
    if
        SwapThis == [] ->
            1;
        true ->
            1 + 
            recurse(SwapThis, CoinNum) + 
            recurse(CoinSet, CoinNum + 1)
    end.

startlist() ->
    lists:duplicate(5, 1).

start() ->
    recurse(startlist(), 1).