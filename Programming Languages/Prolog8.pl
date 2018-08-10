% Natural numbers
nat(zero).
nat(s(X)) :- nat(X).

% Less than or equal
le(zero,X) :- nat(X).
le(s(X),s(Y)) :- le(X,Y).

% plus(X,Y,Z) => nat numbers such that X+Y=Z
plus(zero,Y,Y) :- nat(Y).
plus(s(X),Y,s(Z)) :- plus(X,Y,Z).

% times(X,Y,Z) => nat numbers such that X*Y=Z
times(zero,X,zero) :- nat(X).
times(s(X),Y,Z) :- times(X,Y,XY), plus(XY,Y,Z).

% minus(X,Y,Z) => nat numbers such that X-Y=Z
minus(X,zero,X) :- nat(X).
minus(X,s(Y),Z) :- minus(X,Y,s(Z)).

% mod(X,Y,Z) => nat numbers such that X%Y=Z
mod(X,Y,X) :- le(X,Y).
mod(X,Y,Z) :- plus(X1,Y,X), mod(X1,Y,Z).

% even(X) is even
even(X) :- mod(X,s(s(zero)),zero).

% odd(X) is odd
odd(X) :- mod(X,s(s(zero)),s(zero)).

% fib(N,F): F is the Nth Fibonacci number
fib(zero,zero).
fib(s(zero),s(zero)).
fib(N,F) :- le(s(zero),N), minus(N,s(zero),N1), minus(N,s(s(zero)),N2), fib(N1,F1), fib(N2,F2), plus(F2,F1,F).
% fib(s(s(N)),F) :- le(s(zero),s(s(N))), N1 = s(N), N2 = N, fib(s(N),F1), fib(N,F2) plus(F2,F1,F).
% fib(N,F) :- N > 1, N1 is N - 1, N2 is N-2, fib(N1,F1), fib(N2,F2), F is F2 + F1.

% gcd(X,Y,Z): Z is the greatest common divisor between X, Y
gcd(zero,X,X) :- !.
gcd(X,zero,X) :- !.
gcd(X,Y,Z) :- le(X,Y), !, X \= zero, Y \= zero, minus(Y,X,Z1), gcd(X,Z1,Z).
gcd(X,Y,Z) :- X \= zero, Y \= zero, gcd(Y,X,Z).

% prime(X): indicate whether or not X is a prime number
divisible(X,Y) :- mod(X,Y,zero), !.
divisible(X,Y) :- le(Y,X), divisible(X,s(Y)).
prime(X) :- le(s(s(zero)),X), not(divisible(X,s(s(zero)))).

% Verification of NATURAL NUMBERS, part 3 % %    fib(N,F): F is the Nth Fibonacci number [ e.g., fib(0,0), fib(s(0),s(0)), fib(s(s(0)),s(0)) ] %    gcd(X,Y,Z): Z is the greatest common divisor between X, Y %    prime(X): indicate whether or not X is a prime number
verify :-    writeln('Begin testing.'),     verify(fib1),     verify(fib2),     verify(gcd1),     verify(gcd2),     verify(prime),       writeln('Testing complete.').
verify(P) :-     test(P), write('  PASS - '), writeln(P);     not(test(P)), write('* FAIL - '), writeln(P).
getNumbers1(Zero,One,Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten) :-    Zero = zero, One = s(Zero), Two = s(One), Three = s(Two), Four = s(Three), Five = s(Four),     Six = s(Five), Seven = s(Six), Eight = s(Seven), Nine = s(Eight), Ten = s(Nine).
test(fib1) :-    getNumbers1(Zero,One,Two,Three,Four,Five,Six,_,Eight,Nine,_),     fib(Zero,Zero),     fib(One,One),     fib(Two,One),     fib(Three,Two),     fib(Four,Three),     fib(Five,Five),     fib(Six,Eight),     not(fib(One,Zero)),     not(fib(Two,Two)),     not(fib(Six,Three)),     not(fib(Six,Six)),     not(fib(Six,Nine)).
test(fib2) :-    getNumbers1(_,One,_,_,_,Five,_,Seven,Eight,Nine,_),     plus(Five,Eight,Thirteen),     plus(Eight,Thirteen,Twentyone),     plus(Thirteen,Twentyone,Thirtyfour),     plus(Eight,Nine,Seventeen),     plus(Seventeen,One,Eighteen),     plus(Eighteen,One,Nineteen),     times(Eight,Seventeen,Onethirtysix),     times(Onethirtysix,Nineteen,Twentyfiveeightyfour),     fib(Seven,Thirteen),     fib(Eight,Twentyone),     fib(Nine,Thirtyfour),     fib(Eighteen,Twentyfiveeightyfour),     not(fib(Seven,Eight)),     not(fib(Seven,Twentyone)),     not(fib(Eight,Thirteen)),     not(fib(Seventeen,Twentyfiveeightyfour)),     not(fib(Nineteen,Twentyfiveeightyfour)).
test(gcd1) :-    getNumbers1(_,One,Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten),     gcd(Two,Three,One), gcd(Four,Six,Two),     gcd(Four,Seven,One),     gcd(Four,Eight,Four),     gcd(Five,Eight,One),     gcd(Six,Nine,Three),     gcd(Eight,Ten,Two),     gcd(Nine,Six,Three),     gcd(Ten,Eight,Two),     not(gcd(Eight,Ten,One)),     not(gcd(Ten,Eight,One)),     not(gcd(Four,Eight,Eight)).
test(gcd2) :-
    getNumbers1(_,One,Two,Three,Four,Five,Six,Seven,Eight,_,Ten),     times(Three,Four,Twelve),     times(Two,Ten,Twenty),     times(Three,Eight,Twentyfour),     times(Five,Six,Thirty),     times(Five,Seven,Thirtyfive),     times(Five,Eight,Forty),     times(Six,Seven,Fortytwo),     times(Six,Ten,Sixty),     gcd(Twentyfour,Thirtyfive,One),     gcd(Twentyfour,Fortytwo,Six),     gcd(Thirty,Thirtyfive,Five),     gcd(Forty,Thirty,Ten),     gcd(Forty,Sixty,Twenty),     gcd(Forty,Fortytwo,Two),     gcd(Fortytwo,Twentyfour,Six),     gcd(Sixty,Twentyfour,Twelve),     not(gcd(Sixty,Twentyfour,Twentyfour)),     not(gcd(Sixty,Thirty,Ten)),     not(gcd(Ten,Sixty,Five)),     not(gcd(Forty,Thirty,Twenty)).
test(prime) :-    getNumbers1(_,_,Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten),     times(Three,Ten,Thirty),     plus(Thirty,One,ThirtyOne),     times(Six,Thirty,OneEighty),     plus(One,OneEighty,OneEightyOne),     plus(Seven,OneEighty,OneEightySeven),     prime(Two),     prime(Three),     not( prime(Four) ),     prime(Five),     not( prime(Six) ),     prime(Seven),     not( prime(Eight) ),     not( prime(Nine) ),     not( prime(Ten) ),     not( prime(Thirty) ),     prime( ThirtyOne ),     prime(OneEightyOne),     not( prime(OneEightySeven) ).    