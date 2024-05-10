sum :-write("Enter the first number "),
      read(X),
      write("Enter the second number "),
      read(Y),
      Z is X+Y,
      write(Z).


max(X,Y,M) :- X>Y -> M is X ; M is Y.


factorial(0,1) :- !.
factorial(1,1).
factorial(N,F) :- N>0,N1 is N-1 ,factorial(N1,F1),F is F1*N.


generate_fib(1,0) :-!.
generate_fib(2,1).
generate_fib(N,T) :-N>0 ,N1 is N-1,N2 is N-2,generate_fib(N1,T1),generate_fib(N2,T2),T is T1+T2.


gcd(X,Y,T) :- X=Y -> T is X.
gcd(X,Y,T) :- X>Y-> X1 is X-Y ,gcd(X1,Y,T1),T is T1; Y1 is Y-X ,gcd(X,Y1,T2),T is T2. 


power(0,0,0).
power(Num,0,1) :- Num>0.
power(Num,Pow,Ans) :- Num>0 ,Pow>0,P1 is Pow-1,power(Num,P1,R1),Ans is R1*Num.


multi(N1,1,N1).
multi(N1,N2,R) :- R1 is N2-1,multi(N1,R1,R2),R is R2+N1.


memb(X,[X|_]) :- !.
memb(X,[_|T]) :- memb(X,T).


sumlist([],0) :- !.
sumlist([H|T],S) :- sumlist(T,S1),S is H+S1.


conc(L1,[],L1).
conc([],[],[]).
conc([],L2,L2).
conc([H|L1],L2,[H|L3]) :- conc(L1,L2,L3).


reverse([],[]).
reverse([H|T],R) :- reverse(T,R1),conc(R1,[H],R).


palindrome(L) :- reverse(L,L) ,L==L -> write("Given list is PALINDROME"); write("Given list is NOT PALINDROME").


evenlength([]).
evenlength([_|T]):- oddlength(T).
oddlength([_]).
oddlength([_|T]):- evenlength(T).



nth_element(1,[H|T],H) :- !.
nth_element(N,[H|T],X):- N1 is N-1,nth_element(N1,T,X).


maxm(X,Y,Z) :- X>Y ,Z is X; Z is Y.
maxlist([],O).
maxlist([R],R) :- !.
maxlist([H|T],M) :- maxlist(T,M1), maxm(H,M1,M).



insert_nth(I, 1, L, [I|L]) :- !.
insert_nth(I, N, [H|L], [H|R]) :- N1 is N - 1,
                                  insert_nth(I, N1, L, R).


delete_nth(1, [_|L], L) :- !.
delete_nth(N, [H|L], [H|R]) :- N1 is N - 1,
                               delete_nth(N1, L, R).


merge(X, [], X).
merge([], Y, Y).
merge([X|X1], [Y|Y1], [X|Z]) :- X < Y, !, merge(X1, [Y|Y1], Z).
merge([X|X1], [Y|Y1], [X,Y|Z]) :- X == Y, !, merge(X1, Y1, Z).
merge([X|X1], [Y|Y1], [Y|Z]) :- X > Y, !, merge([X|X1], Y1, Z).



duplicates([],[]):- !.
duplicates([H|T],R):- memb(H,T), duplicates(T,R).
duplicates([H|T],[H|R]):- duplicates(T,R).  



delete_element(_, [], []). 
delete_element(X, [X|T], T1) :-  delete_element(X, T, T1). 
delete_element(X, [H|T], [H|T1]) :-delete_element(X, T, T1).



sentence(A,C):- nounPhrase(A, B), verbPhrase(B,C).

nounPhrase(A,C):- article(A,B), noun(B,C).
nounPhrase(A,B):- noun(A,B).
verbPhrase(A,C):- verb(A,B), prepositionPhrase(B,C).
verbPhrase(A,B):- verb(A,B).
verbPhrase(A,C):- verb(A,B), nounPhrase(B,C).

prepositionPhrase(A,C):- preposition(A,B), nounPhrase(B,C). 

preposition([at|X],X).
article([a|X],X).
article([the|X],X).
noun([dog|X],X).
noun([cow|X],X).
noun([moon|X],X).
verb([barked|X],X).
verb([winked|X],X).


grandparent(X,Z):-parent(X,Y),parent(Y,Z).
father(X,Y):-male(X),parent(X,Y).
mother(X,Y):-female(X),parent(X,Y).
brother(X,Y):-male(X),parent(Z,X),parent(Z,Y).
sister(X,Y):-female(X),parent(Z,X),parent(Z,Y).
sibling(X,Y):-parent(Z,X),parent(Z,Y).
uncle(X,Z):-male(X),parent(Y,Z),brother(X,Y).
aunt(X,Z):-female(X),parent(Y,Z),sister(X,Y).
husband(X,Y):-male(X),female(Y),married(X,Y).
wife(X,Y):-female(X),male(Y),married(X,Y).


























                  








                