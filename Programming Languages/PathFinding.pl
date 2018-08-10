backwards(A,B,C) :- path(A,B,C).
backwards(A,B,C) :- path(B,A,C).

findPath([B | Tail], B, [B | Tail], Dist, Dist).
findPath([A | Tail], B, Path, Distance, Dist) :-
    backwards(A, C, X),
    \+member(C, [A | Tail]),
    Length is Distance + X,
    findPath([C, A | Tail], B, Path, Length, Dist).

solve(A, B,Path,Dist) :-
    findPath([A], B, Path1, 0, Dist),
    reverse(Path1, Path).