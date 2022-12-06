-module(qubit).
-export([measure/1, create/2]).

-record(qubit, {alpha, beta}).

create(A, B) ->
    #qubit{alpha=A, beta=B}.

measure(Q) -> 
    Alpha = Q#qubit.alpha,
    Random = rand:uniform_real(),
    Alphasquare = math:pow(Alpha, 2),
    if 
        Random < Alphasquare -> 0;
        true -> 1
    end.
