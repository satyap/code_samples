Prime multiplication coding challenge
=====================================

Objective
---------

Write a program that prints out a multiplication table of the first 10 prime
numbers.

The program must run from the command line and print one table to STDOUT.

The first row and column of the table should have the 10 primes, with
each cell containing the product of the primes for the corresponding row and column.

Notes
-----

• Consider complexity. How fast does your code run? How does it scale?

• Consider cases where we want N primes.

• Do not use the Prime class from stdlib (write your own code).


Implementation thoughts
-----------------------

I have implemented this by calculating the whole 2d array and then printing it
out. We can trade memory for speed by calculating each row and then printing
it. Memory is (relatively) cheap. If we expect to be calculating *really* large
arrays, we could switch the implementation.
