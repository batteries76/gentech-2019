
## Discrete Maths Extra Notation Topics

### Sum of

First we need a domain - a set of values to iterate over. Here we are going to sum the result of that domain when passed through a function.

<pre>
X = [4, 7, 9, 2, 1]
</pre>
This is a set of integers.

```Σ``` 

This is the symbol that tells us that we are getting the sum of something. Mostly (for our purposes) we will be getting the sum of a finite series of numbers. Eg, 
<pre>
<sub>         4</sub>
f(X) = ⎲ x<sub>i</sub><sup>2</sup>
       ⎳
<sup>        i=0</sup>
</pre>

This is possibly very confusing notation, but bear with me for a minute.

Here we are saying that we are running a function over the set of X (the domain). The function in question is the 
<pre>
    x<sub>i</sub><sup>2</sup>
</pre>
part of the equation.

It looks messy, but we can treat the x like a variable, and the little ```i``` as the iterator. 

In this world (the Discrete Maths world), there are no fractions. So here we start at 0, and move up by steps, iterating through our domain of elements.