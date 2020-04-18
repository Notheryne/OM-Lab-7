# OM-Lab-7
Single variable function optimization.

## Chosen method: Fibonacci Search optimization
<b>The Fibonacci Search</b> optimization method is similar to <b>Golden Section</b> method,
but the ratio for the reduction of interval is not constant, instead it changes in optimal way.
Additionally, the number of iterations is predetermined based on the expected accuracy.

One of the downsides of this method is that, a number from Fibonacci Series
must be calculated in every iteration.

The section is reduced to

<img src="https://latex.codecogs.com/gif.latex?\frac{2}{F_(N+1)} * (upperbound - lowerbound)" /> 

which requires `n` iterations.