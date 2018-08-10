root(v50).
hasLeftChild(v50,v20).
hasLeftChild(v20,v10).
hasLeftChild(v40,v30).
hasLeftChild(v70,v60).
hasRightChild(v50,v70).
hasRightChild(v20,v40).
hasRightChild(v70,v80).
hasRightChild(v80,v90).
hasRightChild(v90,v100).

isParentOf(Parent,Child) :- hasLeftChild(Parent,Child).
isParentOf(Parent,Child) :- hasRightChild(Parent,Child).

siblings(A,B) :- hasLeftChild(P,A), hasRightChild(P,B).
siblings(A,B) :- hasRightChild(P,A), hasLeftChild(P,B).

isAncestorOf(Ancestor,Descendant) :- isParentOf(Ancestor,Descendant).
isAncestorOf(Ancestor,Descendant) :- isParentOf(Ancestor,Parent), isAncestorOf(Parent,Descendant).

isGreaterThan(A,B) :- hasLeftChild(A,B).
isGreaterThan(A,B) :- hasRightChild(B,A).
isGreaterThan(A,B) :- hasLeftChild(P,B), hasRightChild(P,A).
isGreaterThan(A,B) :- isAncestorOf(C,B), hasLeftChild(A,C).
isGreaterThan(A,B) :- isAncestorOf(C,A), hasRightChild(B,C).
isGreaterThan(A,B) :- isAncestorOf(D,A), hasLeftChild(D,B).
isGreaterThan(A,B) :- isAncestorOf(D,B), hasRightChild(D,A).
isGreaterThan(A,B) :- isAncestorOf(D,A), isAncestorOf(C,B), hasLeftChild(E,C), hasRightChild(E,D).