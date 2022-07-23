
% CSC233, SIT@KMUTT
% May 2022
% By PM

% Proposition is a statement either true or false.
% Objects in the propositions can either be variable or constant

% Constant can be atom or number
% Atom is a symbolic value; atom is either
%  - string of letters, beginning with lowercase letter, e.g., aCar
%  - string of letters, delimited by apostrophes, e.g., 'Hello'

% A functor begins with a lower-case letter, and later with a
% pair of parenthesis. Note that every statement must end with a period.

% In short, functors are syntactic elements we use to build structures
% (compound terms) from simpler ones. Functors are syntactic units that
% have a finite number of arguments ("arity").

% A color schema used here in Prolog editor.
% Bold text is used to indicate the definition of objects

% Red bold --> a head of a predicate that is not called
% Black bold --> a head of a predicate that is called (appearing on a
% right hand side of :- somewhere)

% Brown --> Variable
% Dark green --> Comment
% Dark blue --> Quoted atom or string
% Blue --> Call to built-in or imported predicate


color('Yellow').
color(red).
% head without body
num(45).
num(a,56).
str(aBCdef).
nine().
five.   % Is it the same as five()? yes the same
% empty argument and have no argument is the same


%These are facts. we define them to be
speed(toyota, 200).
speed(honda, 150).


time(toyota, 2).
time(honda, 3).

%This is a rule. A variable is beginning with an uppercase letter.
distance(C, D) :- speed(C, Sp), time(C,Tm), D is Sp*Tm.
% this is a head with some body

%Warning about using recursion

%infinite loop/recursion
predicate1(X):- predicate2(X,X).
%predicate2(X,Y):- predicate1(X), X \= Y.

%try to switch an order of the second function; the result is False
predicate2(X,Y) :- X \= Y, predicate1(X).
% \=  -> not equal

%examples about a family tree
female(amy).
female(jun).
amy.
male(suki).
male(roy).
mom(jun, suki).
dad(roy, suki).
son(X,Y):- parent(Y,X), male(X).    % use a comma , for AND
parent(X,Y):-mom(X,Y); dad(X,Y).    % use a semicolon ; for OR
%for the NOT, use "not", e.g., not(X == Y)

%if-then-else
%Z is the returned value of the maximum between X and Y values.
max(X,Y, Z):-
    ( (X > Y) ->  Z is X ; Z is Y).

%other relational operators, =<, >=
%
%



% Calculate a sphere's volume.
%
sphere(R,Vol) :-
    Pi is 3.14159,
    Vol is(4/3) * Pi * R * R * R.

% Sum all digits in a given integer number.
%
sum(0,0).
sum(N, S) :-
    N > 0,
    R is N mod 10,
    D is N div 10,
    sum(D, Snew),
    S is R + Snew.



% Calculate day for a given date in May 2022.

may(1,sun).
may(2,mon).
may(3,tue).
may(4,wed).
may(5,thu).
may(6,fri).
may(7,sat).
% it will return answer and false
%it false because there is no more answer


may(Date,Day):-
    integer(Date),
    Date > 7,
    Date =< 31,
    M is Date mod 7,
    (M = 0 -> N is 7; N is M ),
    may(N,Day).

added7(D) :-
    D >= 0,
    D =< 31,
    print(D),
    write(' '),
    D1 is D+7,
    added7(D1).

% dates_in_day(X):- may(Date,X), added7(Date).

mySum(Date,X) :- may(X1,Date),
    X1 >= 0,
    X1 =< 31 ,
    print(X1), write(' '),
    D1 is X1 +7 ,
    X is X1 + D1.





factorial(0,1).
factorial(N,F):- N >0,
    N1 is N - 1,
    factorial(N1,F1),
    F is N * F1.
