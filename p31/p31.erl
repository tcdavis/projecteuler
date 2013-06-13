-module(p31).

-export([checkSwap/2]).
-export([startlist/1]).
-export([trySwap/2]).
-export([recurse/2]).
-export([start/1]).

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
    CoinVal = lists:nth(CoinNum, Coins),
    SwapOK = checkSwap(CoinSet, CoinVal),
    if
       SwapOK ->
            lists:append(lists:nthtail(CoinVal, CoinSet), [CoinVal]);
        true ->
            []
    end.


recurse(CoinSet, CoinNum) ->
    if 
        CoinNum > 7 ->
            1;
        true ->
            SwapThis = trySwap(CoinSet, CoinNum),
            if
                SwapThis == [] ->
                    1;
                true ->
                    recurse(SwapThis, CoinNum) + 
                    recurse(CoinSet, CoinNum + 1)
            end
    end.

startlist(N) ->
    lists:duplicate(N, 1).

start(N) ->
    recurse(startlist(N), 1).