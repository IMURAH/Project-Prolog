% Le Cai
% Project Prolog
% @version 11/3/18

% Rooms with phones
  ringing(5).
  ringing(9).
  ringing(16).

  :- dynamic(max/2).
  max(5, 0).
  max(9, 0).
  max(16, 0).

  :- dynamic(min/2).
  min(5, 20).
  min(9, 20).
  min(16, 20).

% Define rooms that connect to each other.
  connect(2, 1).
  connect(7, 1).
  connect(1, 2).
  connect(8, 2).
  connect(8, 3).
  connect(8, 4).
  connect(9, 4).
  connect(6, 5).
  connect(9, 5).
  connect(9, 6).
  connect(1, 7).
  connect(8, 7).
  connect(9, 7).
  connect(10, 7).
  connect(11, 7).
  connect(12, 7).
  connect(13, 7).
  connect(14, 7).
  connect(2, 8).
  connect(3, 8).
  connect(4, 8).
  connect(7, 8).
  connect(4, 9).
  connect(5, 9).
  connect(6, 9).
  connect(7, 9).
  connect(7, 10).
  connect(7, 11).
  connect(7, 12).
  connect(7, 13).
  connect(7, 14).
  connect(14, 15).
  connect(16, 15).
  connect(15, 16).

  :- dynamic(traveled/2).

  adjacent(RoomA, RoomB) :- connect(RoomA, RoomB); connect(RoomB, RoomA).

  banned(RoomA, RoomB) :- connect(RoomA, RoomB), (traveled(RoomA, RoomB); traveled(RoomB, RoomA)).

  path_to_phone(Start, Finish, Path) :-
    ringing(Finish),
    connect(Start, Finish),
    \+(banned(Start, Finish)),
    \+(Start = Finish),
    nth(1, Path, Start),
    nth(2, Path, Finish),
    length(Path, 2),
    last(Path, Finish).

  path_to_phone(Start, Finish, Path) :-
    ringing(Finish),
    connect(Start, Next),
    \+(banned(Next, Start)),
    \+(Start = Finish),
    travel_ban(Start, Next),
    [H|T] = Path,
    =(H, Start),
    ;(path_to_phone(Next, Finish, T), (travel_ban_overturned(Start, Next), fail)).

  travel_ban(Start, Next) :-
    asserta(traveled(Start, Next)),
    asserta(traveled(Next, Start)).

  travel_ban_overturned(Start, Next) :-
    retract(traveled(Start, Next)),
    retract(traveled(Next, Start)).

  minpath_to_phone(Start, End, Path, Count) :-
    findall(Path, minPathFinder(Start, End, Path, Count), _),
    minPathFinder(Start, End, Path, Count).

  minPathFinder(Start, End, Path, Count) :-
    path_to_phone(Start, End, Path),
    length(Path, Count),
    min(End, CurMin),
    @=<(Count, CurMin),
    retractall(min(End, _)),
    asserta(min(End, Count)).

  maxpath_to_phone(Start, End, Path, Count) :-
    findall(Path, maxPathFinder(Start, End, Path, Count), _),
    maxPathFinder(Start, End, Path, Count).

  maxPathFinder(Start, End, Path, Count) :-
    path_to_phone(Start, End, Path),
    length(Path, Count),
    max(End, CurMax),
    @>=(Count, CurMax),
    retractall(max(End, _)),
    asserta(max(End, Count)).
