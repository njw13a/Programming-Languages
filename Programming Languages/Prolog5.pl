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

% Verification of NATURAL NUMBERS, part 1 % %    minus(X,Y,Z): X-Y = Z, fail where Z is not a natural number (i.e., negative) %    mod(X,Y,Z): X mod Y = Z (modulus) %    even(X): X is even %    odd(X): X is odd
verify :-    writeln('Begin testing.'),     verify(minus1),     verify(minus2),     verify(mod1),     verify(mod2),     verify(even1),     verify(even2),     verify(odd1),     verify(odd2),       writeln('Testing complete.').
verify(P) :-     test(P), write('  PASS - '), writeln(P);     not(test(P)), write('* FAIL - '), writeln(P).
getNumbers1(Zero,One,Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten) :-    Zero = zero, One = s(Zero), Two = s(One), Three = s(Two), Four = s(Three), Five = s(Four),     Six = s(Five), Seven = s(Six), Eight = s(Seven), Nine = s(Eight), Ten = s(Nine).
test(minus1) :-    getNumbers1(Zero,One,Two,Three,Four,Five,Six,Seven,Eight,_,_),     minus(Zero,Zero,Zero),     minus(One,Zero,One),     minus(One,One,Zero),     minus(Two,One,One),     minus(Three,One,Two),     minus(Three,Two,One),     minus(Four,Two,Two),     minus(Five,Two,Three),     minus(Five,Four,One),     minus(Six,Four,Two),     minus(Six,Six,Zero),     minus(Seven,Three,Four),     minus(Seven,Five,Two),     minus(Eight,Two,Six),     minus(Eight,Seven,One).
test(minus2) :-    getNumbers1(Zero,One,Two,Three,Four,_,Six,Seven,Eight,Nine,Ten),     minus(Nine,Zero,Nine),     minus(Ten,Three,Seven),     minus(Ten,Seven,Three),     minus(Ten,Nine,One),     not( minus(Zero,One,_) ),     not( minus(Two,Eight,_) ),     not( minus(Four,Six,_) ),     not( minus(Six,Ten,_) ),     not( minus(Eight,Nine,_) ).
test(mod1) :-    getNumbers1(Zero,One,Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten),




times(Three,Six,Eighteen),     times(Five,Six,Thirty),     mod(Eighteen,One,Zero),     mod(Eighteen,Two,Zero),     mod(Eighteen,Three,Zero),     mod(Eighteen,Four,Two),     mod(Eighteen,Five,Three),     mod(Eighteen,Six,Zero),     mod(Eighteen,Seven,Four),     mod(Eighteen,Eight,Two),     mod(Eighteen,Nine,Zero),     mod(Eighteen,Ten,Eight),     mod(Thirty,Three,Zero),     mod(Thirty,Four,Two),     mod(Thirty,Five,Zero),     mod(Thirty,Seven,Two),     mod(Thirty,Eight,Six),     mod(Thirty,Nine,Three),     mod(Thirty,Ten,Zero).
test(mod2) :-
    getNumbers1(Zero,One,_,Three,_,_,_,Seven,Eight,_,Ten),     plus(Ten,One,Eleven),     times(Seven,Eight,Fiftysix),     mod(Three,Eleven,Three),     mod(Eight,Eleven,Eight),     mod(One,Fiftysix,One),     mod(Eleven,Fiftysix,Eleven),     mod(Eleven,Eleven,Zero),     mod(Fiftysix,Eleven,One).
test(even1) :-    getNumbers1(Zero,_,Two,_,Four,_,Six,_,Eight,_,Ten),     even(Zero ),     even(Two  ),     even(Four ),     even(Six  ),     even(Eight),     even(Ten  ).
test(even2) :-    getNumbers1(_,One,_,Three,_,Five,_,Seven,_,Nine,_),     not( even(One)   ),     not( even(Three) ),     not( even(Five)  ),     not( even(Seven) ),     not( even(Nine)  ).
test(odd1) :-    getNumbers1(_,One,_,Three,_,Five,_,Seven,_,Nine,_),     odd(One  ),     odd(Three),     odd(Five ),     odd(Seven),     odd(Nine ).
test(odd2) :-    getNumbers1(Zero,_,Two,_,Four,_,Six,_,Eight,_,Ten),     not( odd(Zero ) ),     not( odd(Two  ) ),     not( odd(Four ) ),     not( odd(Six  ) ),     not( odd(Eight) ),     not( odd(Ten  ) ).