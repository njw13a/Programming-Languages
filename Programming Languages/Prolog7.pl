% prefix( A, B ) - valid when list A is a prefix of list B
prefix([],B).
prefix([A|As],[A|Bs]) :- prefix(As,Bs).

% suffix( A, B ) - valid when list A is a suffix of list B
suffix(A,A).
suffix(A,[B|Bs]) :- suffix(A,Bs).

% sublist( A, B ) - valid when list A is a sublist of list B
sublist(A,B) :- prefix(A,B).
sublist(A,[B|Bs]) :- sublist(A,Bs).