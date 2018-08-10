pow(B,0,1).
pow(B,E,P) :- E1 is E - 1, pow(B,E1,P1), P is P1 * B.