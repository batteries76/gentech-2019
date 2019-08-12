
## Discrete Maths Extra Notation Topics

### Sum of

First we need a domain - a set of values to iterate over. Here we are going to sum the result of that domain when passed through a function.

<pre>
X = [4, 7, 9, 2, 1]
</pre>
This is a set of integers. We are representing it as an array, which is really just a type of set.

<b>```Σ```</b>

This is the symbol that tells us that we are getting the sum of something. Mostly (for our purposes) we will be getting the sum of a finite series of numbers. Eg, 
<pre>
<sup>             4</sup>
f(X) = ⎲ x<sub>i</sub><sup>2</sup>
       ⎳
<sup>           i=0</sup>
</pre>

This is possibly very confusing notation, but bear with me for a minute.

Here we are saying that we are running a function over the set of X (the domain). The function in question is the 
<pre>
    x<sub>i</sub><sup>2</sup>
</pre>
part of the equation.

It looks messy, but we can treat the x like a variable, and the little ```i``` as the iterator.

In this world (the Discrete Maths world), there are no fractions. So here we start at 0, and move up by steps, iterating through our domain of elements. So we are going to iterate through our array, applying the function to each element. And we are going to sum it all. 

The top of the ```Σ``` is the number that our <sub>i</sub> is going to stop at. 

It's like a loop with an accumulator. We have a counter that will help to iterate, with a starting value and an terminating value, and we have a function which is like a bit of code within the loop. And we are going to return a value that has built up in the loop.

Breaking it down the steps would be:
<pre>
x<sub>0</sub><sup>2</sup> + x<sub>1</sub><sup>2</sup> + x<sub>2</sub><sup>2</sup> + x<sub>3</sub><sup>2</sup> + x<sub>4</sub><sup>2</sup>
</pre>
which, given ```X = [4, 7, 9, 2, 1]```, is:
<pre>
4<sup>2</sup> + 7<sup>2</sup> + 9<sup>2</sup> + 2<sup>2</sup> + 1<sup>2</sup>
</pre>
and then..
<pre>
16 + 49 + 81 + 4 + 1
</pre>
which is: ```151```

Let's try one more example: Let's say that we are given this version:

Our set is:
<pre>
X = [1, 3, 2, 7, 1]
</pre>

and our function to calculate is:

<pre>
<sub>         4</sub>
f(X) = ⎲ 2x<sub>i</sub> + 3
       ⎳
<sup>        i=0</sup>
</pre>

<pre>
(2x<sub>0</sub> + 3) + (2x<sub>1</sub> + 3) + (2x<sub>2</sub> + 3) + (2x<sub>3</sub> + 3) + (2x<sub>4</sub> + 3)
</pre>
which, given ```X = [1, 3, 2, 7, 1]```, is:
<pre>
(2*1 + 3) + (2*3 + 3) + (2*2 + 3) + (2*7 + 3) + (2*1 + 3)
</pre>
and then..
<pre>
5 + 9 + 7 + 17 + 5
</pre>
which is: ```43```