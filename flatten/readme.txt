(I decided to do some test-driven development. This is my first interaction
with rspec. I've recently started using cucumber and JUnit. (Note: I'm not
really a Java programmer.))

I started with the tests for Array#flatten2, which is what I decided to call my
implementation of Array#flatten.

I added the Array#flatten! method because it's expected that methods which
returns a modified object may have a bang-equivalent which modifies the object
in-place, and because it wasn't hard to do.

The tests compare the result of my method with Array#flatten. At first I was
hard-coding the "correct" output but it really makes sense, since I'm
implementing an existing method, to test against that method.

All that took less than 30 minutes, including deciding to use rspec, gem
installing it, and figuring out where the binary lives (it wasn't on my path;
it is now).

flatten_iter:

Then I looked at the code and found that it's pretty inefficient: it makes a
copy of the array and then traverses each and every element. I remembered
discussing whether this could be done iteratively.

I still couldn't think of a way, but I recalled that there is such a thing as
shell-sort, and I saw some example code for Fibonacci sequences, and eventually
I came up with the code in `Array#flatten_iter!`. That took an additional 30 minutes.

At first I had coded it as Array#flatten_iter but found that it makes much more
sense to do it the other way: flatten_iter! could do the "real" work while
flatten_iter would clone the array and call flatten_iter! on the result. In
this sense, flatten_iter! isn't "extra" un-asked-for functionality; it's free.

The methods could use better names, admittedly.

Running the tests:
rspec array_spec_iter.rb array_spec.rb
