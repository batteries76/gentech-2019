
# Discrete Maths Extra Notation Topics

## Sum of

To get the sum of a series or set, first we need a domain - a set of values to iterate over. Here we are going to sum the result of that domain when passed through a function.

Here is the set that will be our domain:
<pre>
X = [4, 7, 9, 2, 1]
</pre>
This is a set of integers. We are representing it as an array, which is really just a type of set.

<b>```Σ```</b>

This is the symbol that tells us that we are getting the sum of something. In our case, we will be getting the sum of a finite series of numbers. Eg, 
<pre>
<sup>           4</sup>
f(X) = ⎲ x<sub>i</sub><sup>2</sup>
       ⎳
<sup>          i=0</sup>
</pre>

This is possibly very confusing notation, but bear with me for a minute.

Here we are saying that we are running a function over the set of X (the domain). The function in question is the 
<pre>
    x<sub>i</sub><sup>2</sup>
</pre>
part of the equation.

It looks messy, but we can treat the x like a variable, and the little ```i``` as the iterator.

In this world (the Discrete Maths world), there are no fractions. So here we start at 0, and move up by steps, iterating through our domain of elements. So we are going to iterate through our array, applying the function to each element. And finally we are going to sum it all up. 

At the bottom of the ```Σ``` is the starting point for our iterator, our <sub>i</sub>, and on top of the ```Σ``` is the number that our <sub>i</sub> is going to stop at. 

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
<sup>           4</sup>
f(X) = ⎲ 2x<sub>i</sub> + 3
       ⎳
<sup>          i=0</sup>
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

## Set Building 

Let's take a example as a starting point. 

Here is a possible set:
<pre>
{ x | x ϵ ℕ; x < 206; x ≥ 202 }
</pre>

We can read this off that we are buiding a set of ```x```s, where the ```x```s in question come from (are elements of, ```ϵ```) all of the natural numbers (```ℕ```), are less than 206, and greater than or equal to 200. 

The natural numbers are all the non-negative integers (meaning 0 and the positive integers). 

The set we get is:
<pre>
X = { 202, 203, 204, 205 }
</pre>

One more example:
<pre>
{ x | x ϵ ℕ; x < 50; x ≥ 25; x mod 7 = 0 }
</pre>

Here we read this off that we are buiding a set of ```x```s, where the ```x```s in question come from (are elements of, ```ϵ```) all of the natural numbers (```ℕ```), are less than 50, and greater than or equal to 25, but also are evenly divisible by 7. 

This time the set we get is:
<pre>
X = { 28, 35, 42, 49 }
</pre>

Each element to the right of the ```|``` must be satisfied, and we can add logical operators in here. 

For example, to extend the above example:
<pre>
{ x | x ϵ ℕ; x < 50; x ≥ 25; x mod 7 = 0 ∧ x mod 6 = 0 }
</pre>

Here the last condition is that the ```x```s involved conform to the other conditions that we discussed, but also be divisible by 7 _and_ 6. 

What is the resultant set?

## Sets of Relations

This is the final part of the confusing syntax sojourn, and it's just a twist on the last section. 

In this case we are going to define a set of relations. A relation is just an input with an output, and can be represented as a pair of numbers like this: ```(2,7)```. All we are saying here is that 2 is related to 7 (in some way).

We could now define a set of relations:
<pre>
X = {(2,7), (3,1), (3,0), (10,101), (4,6)}
</pre>
which is like a list of inputs and outputs.

Using a similar syntax as before, we could define a set like this:
<pre>
{(x,y) ϵ T | x ϵ ℕ; y ϵ ℕ; y ≥ 6x + 1 }
</pre>

Here we are saying that the relation ```T``` (just a name for a relation) is defined by the following conditions: the inputs must come from the natural numbers, as must the outputs, and the output must also be greater than 6 times the input, plus 1.

The resultant set contains only one member from ```X```, and looks like this: ```{(10, 101)}```.