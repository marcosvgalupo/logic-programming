
%-----------------------------Exercise 1 --------------------------------------


analise_list([]) :- write('Empty List').
analise_list([A | B]) :- write('The head is: '),write(A), write('\nThe tail is: '),write(B).


%-----------------------------Exercise 2 --------------------------------------

belongsToList(A, [A | _]).
belongsToList(X,[_ | B]) :- belongsToList(X,B).

rd([],[]).
rd([A | B], X) :- belongsToList(A, B), rd(B,X).
rd([A|B], [A | C]) :- rd(B,C).


%-----------------------------Exercise 3 --------------------------------------


change([],_ ,_,[]).
change([A | B], A, X, [X|D]) :- change(B, A, X, D).
change([A|B],C,X,[A|Y]) :- change(B,C,X,Y).


%-----------------------------Exercise 4 --------------------------------------


larger([],_) :- true.
larger(_,[]) :- fail.
larger([_|B],[_|D]) :- larger(B,D). 


%-----------------------------Exercise 5 --------------------------------------


screen(0,_).
screen(X,CHAR) :- write(CHAR), X1 is X-1, screen(X1, CHAR).

squareScreen(0,_). 
squareScreen(X, CHAR) :- screen(X,CHAR), X1 is X-1, nl,squareScreen(X1,CHAR).


%-----------------------------Exercise 6 --------------------------------------


n_th([A|_], 0, A).
n_th([_|B], X, A) :- X1 is X-1, n_th(B, X1, A).


%-----------------------------Exercise 7 --------------------------------------


listLength([], 0).
listLength([_|B], X) :- listLength(B, X1), X is X1 + 1.

sum([X], X).
sum([A|B], R) :- sum(B, AUX), R is A + AUX.  

average([],0).
average(L, RESULT) :- listLength(L, X), sum(L, Y), RESULT is Y/X.


%-----------------------------Exercise 8 --------------------------------------



min([X], X).
min([A|B], R) :- min(B, AUX), AUX < A, R is AUX; min(B,AUX), A < AUX, R is A. 


%-----------------------------Exercise 9 --------------------------------------
 

interval(X,X,[X]).
interval(A,B,[A|L]) :- A1 is A + 1,interval(A1,B,L).

%-----------------------------Exercise 10 -------------------------------------


gcd(X,C,C) :- (X mod C) =:= 0.
gcd(X,C,L) :- X > C, S is X - C, S \= 0, gcd(C, S, L). 
gcd(X,C,L) :- X < C, S is C - X, S \= 0, gcd(C, S, L). 


%-----------------------------Exercise 11 -------------------------------------


div(X,Y) :- div(X, X, Y).
div(_, 1, [1]).
div(X, Z, Y) :- (X mod Z) =\= 0, Z2 is Z-1, div(X, Z2, Y).
div(X, Z, [Z | Y]) :- (X mod Z) =:= 0, Z2 is Z-1, div(X,Z2,Y).


