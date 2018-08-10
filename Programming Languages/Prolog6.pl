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

% minus(X,Y,Z) => nat numbers such that X+Y=Z
minus(X,zero,X) :- nat(X).
minus(X,s(Y),Z) :- minus(X,Y,s(Z)).

% mod(X,Y,Z) => nat numbers such that X%Y=Z
mod(X,Y,X) :- le(X,Y).
mod(X,Y,Z) :- plus(X1,Y,X), mod(X1,Y,Z).

% even(X) is even
even(X) :- mod(X,s(s(zero)),zero).

% odd(X) is odd
odd(X) :- mod(X,s(s(zero)),s(zero)).

% div(X,Y,Z) => nat numbers such that X/Y=Z
div(X,s(Y),zero) :- le(X,Y).
div(X,Y,s(Z)) :- Y \= zero, minus(X,Y,Z1), div(Z1,Y,Z).

% exp(X,Y,Z) => nat numbers such that X^Y=Z
exp(X,zero,s(zero)).
exp(X,s(Y),Z) :- exp(X,Y,Z1), times(Z1,X,Z).

% factorial(N,F) => nat numbers such that N!=F
factorial(zero,s(zero)).
factorial(s(X),Y) :- factorial(X,Y1), times(Y1,s(X),Y).

% Verification of NATURAL NUMBERS, part 2 % %    div(X,Y,Z): X/Y = Z, using integer division; do not allow division by zero %    exp(X,Y,Z): X^Y = Z (exponentiation) %    factorial(N,F): F is N! (factorial)
verify :-    writeln('Begin testing.'),     verify(div1),     verify(div2),     verify(exp1),     verify(exp2),     verify(factorial1),     verify(factorial2),     writeln('Testing complete.').
verify(P) :-     test(P), write('  PASS - '), writeln(P);     not(test(P)), write('* FAIL - '), writeln(P).
getNumbers1(Zero,One,Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten) :-    Zero = zero, One = s(Zero), Two = s(One), Three = s(Two), Four = s(Three), Five = s(Four),     Six = s(Five), Seven = s(Six), Eight = s(Seven), Nine = s(Eight), Ten = s(Nine).
test(div1) :-    getNumbers1(Zero,One,Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten),     div(Ten,Nine,One),     div(Ten,Four,Two),     div(Ten,Three,Three),     div(Ten,Two,Five),     div(Ten,One,Ten),     not( div(Ten,Two,Four) ),     not( div(Ten,Two,Six)  ),     div(Eight,Nine,Zero),     div(Eight,Eight,One),     div(Eight,Seven,One),     div(Eight,Three,Two),     div(Seven,Five,One),     div(Five,Seven,Zero),     div(Five,Three,One),     div(Five,Two,Two),     div(Four,Two,Two),     not( div(Three,Two,Two) ),     div(Three,Two,One).
test(div2) :-    getNumbers1(Zero,One,Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten),     not( div(Three,Zero,_) ),     not( div(Ten,Zero,_) ),     div(Zero,One,Zero),     div(Zero,Eight,Zero),     div(One,Eight,Zero),     div(Six,Five,One),     div(Nine,Four,Two),     div(Seven,Four,One),     not( div(Seven,Four,Two) ).   
test(exp1) :-    getNumbers1(Zero,One,Two,Three,Four,Five,_,Seven,Eight,Nine,Ten),     exp(One,Zero,One),     exp(One,Five,One),exp(Two,One,Two),     exp(Two,Two,Four),     exp(Two,Three,Eight),     exp(Three,Two,Nine),     exp(Seven,Zero,One),     exp(Seven,One,Seven),     exp(Eight,Zero,One),     not(exp(One,Two,Two)),     not(exp(Two,Two,Two)),     not(exp(Two,Two,Eight)),     not(exp(Seven,Two,Ten)).
test(exp2) :-
    getNumbers1(_,One,Two,Three,Four,Five,Six,Seven,Eight,Nine,_),     times(Eight,Two,Sixteen),     times(Five,Five,Twentyfive),     times(Six,Six,Thirtysix),     times(Eight,Eight,Sixtyfour),     times(Nine,Nine,Eightyone),     times(Five,Twentyfive,Onetwentyfive),     times(Sixteen,Eight,Onetwentyeight),     exp(Two,Four,Sixteen),     exp(Two,Six,Sixtyfour),     exp(Two,Seven,Onetwentyeight),     exp(Three,Four,Eightyone),     exp(Four,Two,Sixteen),     exp(Four,Three,Sixtyfour),     exp(Five,One,Five),     exp(Five,Two,Twentyfive),     exp(Five,Three,Onetwentyfive),     exp(Eight,Two,Sixtyfour),     exp(Nine,Two,Eightyone),     not(exp(Three,Three,Eightyone)),     not(exp(Four,Three,Sixteen)),     not(exp(Seven,Two,Thirtysix)).
test(factorial1) :-    getNumbers1(Zero,One,Two,Three,_,_,Six,Seven,_,_,_),     factorial(Zero,One),     factorial(One,One),     factorial(Two,Two),     factorial(Three,Six),     not( factorial(Two,Six) ),     not( factorial(Three,Seven) ).
test(factorial2) :-    getNumbers1(_,_,_,_,Four,Five,Six,_,_,_,_),     times(Six,Four,Twentyfour),     times(Twentyfour,Five,Onetwenty),     times(Onetwenty,Six,Seventwenty),     factorial(Four,Twentyfour),     factorial(Five,Onetwenty),     factorial(Six,Seventwenty),     not( factorial(Five,Seventwenty) ),     not( factorial(Six,Onetwenty) ).