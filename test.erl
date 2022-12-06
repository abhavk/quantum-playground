-module(test).
-export([main/0]).

main() -> 
    Qs = create_n(0.6, 0.8, [], 1000),
    Measurements = measure_n(Qs),
    io:fwrite("Average = ~w.~n", [avg(Measurements)]).

create_n(_A, _B, Qubits, 0) ->
    Qubits;
create_n(A, B, Qubits, N) ->
    create_n(A, B, lists:append(Qubits, [qubit:create(A, B)]), N-1).

measure_n(List) ->
    lists:map(fun(Q) -> qubit:measure(Q) end, List).

avg(List) ->
    lists:sum(List)/length(List).
