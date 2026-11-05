% Task 1: Area and Perimeter

% Square
area_square(Side, Area) :-
    Area is Side * Side.

perimeter_square(Side, Perimeter) :-
    Perimeter is 4 * Side.

% Rectangle
area_rectangle(Width, Height, Area) :-
    Area is Width * Height.

perimeter_rectangle(Width, Height, Perimeter) :-
    Perimeter is 2 * (Width + Height).

% Triangle
area_triangle(Base, Height, Area) :-
    Area is (Base * Height) / 2.

perimeter_triangle(A, B, C, Perimeter) :-
    Perimeter is A + B + C.


% Task 2: Login Page

% Dataset
user_pass(lamyaa, 1234).
user_pass(sara, abcd).
user_pass(admin, admin).

% Start login with 3 attempts
login :-
    login(3).

% Read username and password
login(Attempts) :-
    Attempts > 0,
    write('Username: '),
    read(User),
    write('Password: '),
    read(Pass),
    check_login(User, Pass, Attempts).

% Correct login
check_login(User, Pass, _) :-
    user_pass(User, Pass),
    !,
    write('Login Successful'), nl.

% Wrong login with attempts remaining
check_login(_, _, Attempts) :-
    Attempts > 1,
    write('Login Unsuccessful'), nl,
    NewAttempts is Attempts - 1,
    login(NewAttempts).

% Last attempt failed
check_login(_, _, 1) :-
    write('Login Unsuccessful'), nl,
    write('Sorry, you exceeded the maximum number of attempts, try again later.'), nl.