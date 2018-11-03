# Project-Prolog

This Prolog Project was created for COMP 3220 Project 3 by Le Cai

## Quick Start
**Make sure you have GNU Prolog installed. If not, you can find GNU Prolog here: http://www.gprolog.org/#download**

# Table of Contents
* [Summary](#summary)
* [API](#api)
* [License](#license)
* [Author](#author)
___

#### Summary
For this programming assignment, we will be writing a program in Prolog that will tell us how to get from one
room of a one-story building, to any other room in that building (if it’s possible), by telling us all of the rooms we
must go through to get to the destination room. In addition to the previous statement, there will be phones ringing in
one or more of the rooms. Our prolog program should ONLY tell us how to get to those rooms. If we attempt to go
to a room that does not have a ringing phone, the program should not produce any output.

____

#### API

* path_to_phone - Determines the path from starting room to finishing room.
* minpath_to_phone - try to find the shortest path by using minPathFinder.
* maxpath_to_phone - try to find the longest path by using maxPathFinder.
* minPathFinder - by utilizing path_to_phone, we keep compare the Count we will have the path with shortest count.
* maxPathFinder - by utilizing path_to_phone, we keep compare the Count we will have the path with longest count.

___

#### License

[Auburn University]

___

#### Author

[Le Cai]
