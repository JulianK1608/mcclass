:- module(rint, []).

:- use_module(interval).
:- use_module(r).

:- multifile r_hook/1.
interval:hook(Expr, Res) :-
    !, 
    r_topic(Expr, Res).

interval:monotonical(pbinom(+, -, -)).

r_hook(pbinom(_K, _N, _Pi)).

:- r_source(interval).

rint :-
    K = 10 ... 11,
    N = 20 ... 21,
    Pi = 0.50 ... 0.55,
    interval(pbinom(K, N, Pi), Res),
    writeln(pbinom(K, N, Pi) --> Res).

