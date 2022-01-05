/* Run the program by calling careeradvisory. */
careeradvisory :-
        consult('C:/Users/Admin/Desktop/Sem1/AI/Assignment4_graded/facts.txt'),retractall(response(_,_)), option(Career),!, printmsg(Career), nl, fail.
careeradvisory :-
	write('Thanks for coming to my career advisory system. Happy to serve you. :)'), nl.

/* To check if required values, i.e, either 0 or 1, are inserted by the user. */
read_response(Response) :- 
   read(TmpResponse),(TmpResponse = 0; TmpResponse = 1),!, Response = TmpResponse ; (write('Write either 1 or 0.'), nl, read_response(Response)).

/* Various queries */
query(1,A1):- write('What type of projects you have done: write 1 for Learning based 0 for research based'),nl,read_response(A1),assert(response(1,A1)).
query(2,A2):- write('Did you do TAship, if yes, did youenjoy doing it? 1 for yes, 0 for no'),nl, read_response(A2),assert(response(2,A2)).
query(3,A3):- write('Do you have any novel idea that can transform present technology? 1 for yes, 0 for no'),nl, read_response(A3),assert(response(3,A3)).
query(4,A4):- write('Do you have immediate monetary responsibility for your family/dependents? write 1 if yes, 0 for no'),nl, read_response(A4), assert(response(4,A4)).
query(5,A5):- write('Are you interested in academia? 1 for yes, 0 for no.'),nl,read_response(A5), assert(response(5,A5)).
query(6,A6):- write('Do you have risk taking capability and likes taking challenges in life? 1 for yes, 0 for no'),nl,read_response(A6),assert(response(6,A6)).
query(7,A7):- write('Do you have any published paper/journal? 1 for yes, 0 for no'),nl,read_response(A7), assert(response(7,A7)).
query(8,A8):- write('Do you have thirst for knowledge and likes to read books on a particular topic? 1 for yes, 0 for no'),nl,read_response(A8), assert(response(8,A8)).
query(9,A9):- write('Do you like to have a structured life. 1 for yes, 0 for no'),nl,read_response(A9), assert(response(9,A9)).
query(10,A10):- write('Do you like to try out different things and have creative thinking? 1 for yes, 0 for no'),nl,read_response(A10), assert(response(10,A10)).
query(11,A11):- write('Do you have seeding money? 1 for yes, 0 for no'),nl,read_response(A11), assert(response(11,A11)).
query(12,A12):- write('Are you the person who would love to promote learning? 1 for yes, 0 for no'),nl,read_response(A12), assert(response(12,A12)).
query(13,A13):- write('Are you a team player? 1 for yes, 0 for no'),nl,read_response(A13), assert(response(13,A13)).

/* checking if query already asked before. */
check(Num,Res):- response(Num,Res),!.
check(Num,Res):- query(Num,Res).

/* Checking various options */
option(startup) :-
  (
    ( query(1,A1), A1=0, query(3,A3), A3=1, query(6,A6), A6=1, query(10,A10), A10=1, query(11,A11), A11=1 );
	( response(1,A1), A1=0, check(3,A3), A3=1, check(6,A6), A6=1, check(10,A10), A10=1 );
	( response(1,A1), A1=0, check(3,A3), A3=1, check(6,A6), A6=1, check(11,A11), A11=1 );
	( response(1,A1), A1=0, check(3,A3), A3=1, check(10,A10), A10=1,check(11,A11), A11=1 );
	( response(1,A1), A1=0, check(6,A6), A6=1, check(10,A10), A10=1, check(11,A11), A11=1 );
	( check(3,A3), A3=1, check(6,A6), A6=1, check(10,A10), A10=1, check(11,A11), A11=1 )
  ).

option(teaching) :-
  (
    ( check(12,A12), A12=1, check(4,A4), A4=1, check(5,A5), A5=1, check(9,A9), A9=1, check(2,A2), A2=1 );
	( check(12,A12), A12=1, check(4,A4), A4=1, check(5,A5), A5=1, check(9,A9), A9=1 );
	( check(12,A12), A12=1, check(4,A4), A4=1, check(5,A5), A5=1, check(2,A2), A2=1 );
	( check(12,A12), A12=1, check(4,A4), A4=1, check(9,A9), A9=1, check(2,A2), A2=1	);
	( check(12,A12), A12=1, check(5,A5), A5=1, check(9,A9), A9=1, check(2,A2), A2=1 );	
	( check(4,A4), A4=1, check(5,A5), A5=1, check(9,A9), A9=1, check(2,A2), A2=1 )
  ).
  
option(phd) :-
  (
    ( response(1,A1), A1=0, check(5,A5),A5=1, check(7,A7), A7=1, check(8,A8), A8=1, check(4,A4), A4=0 );	
	( response(1,A1), A1=0, check(5,A5), A5=1, check(7,A7), A7=1, check(8,A8), A8=1 );
	( response(1,A1), A1=0, check(5,A5), A5=1, check(7,A7), A7=1, check(4,A4), A4=0 );	
	( response(1,A1), A1=0, check(5,A5), A5=1, check(8,A8), A8=1, check(4,A4), A4=0 );	
	( response(1,A1), A1=0, check(7,A7), A7=1, check(8,A8), A8=1, check(4,A4), A4=0 );
	( check(5,A5), A5=1, check(7,A7), A7=1, check(8,A8), A8=1, check(4,A4), A4=0 )	
  ).

option(job) :-
  (
    ( response(1,A1),A1=1, check(4,A4),A4=1, check(5,A5),A5=0, check(9,A9),A9=1, check(13,A13),A13=1 );
	( response(1,A1), A1=1, check(4,A4), A4=1, check(5,A5), A5=0, check(9,A9), A9=1	);
    ( response(1,A1), A1=1, check(4,A4), A4=1, check(5,A5), A5=0, check(13,A13), A13=1 );
	( response(1,A1), A1=1, check(4,A4), A4=1, check(9,A9), A9=1, check(13,A13), A13=1 );	
	( response(1,A1), A1=1, check(5,A5), A5=0, check(9,A9), A9=1, check(13,A13), A13=1 );	
	( check(4,A4), A4=1, check(5,A5), A5=0, check(9,A9), A9=1, check(13,A13), A13=1 )	
  ). 
  
option(notfound).

/* Display career choice */
printmsg(job) :-
	name_person(X),write(X),write(', you are suitable for corporate job on the basis of your responses.'), nl.
printmsg(phd) :-
	name_person(X),write(X),write(', you are suitable for PhD on the basis of your responses.'), nl.
printmsg('startup') :-
	name_person(X),write(X),write(', you are suitable for startup on the basis of your responses.'), nl.
printmsg('teaching') :-
	name_person(X),write(X),write(', you are suitable for teaching on the basis of your responses.'), nl.
printmsg('notfound'):-
        name_person(X),write(X),write(', we could not find a career option for you on the basis of your responses.'), nl.