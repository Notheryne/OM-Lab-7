# OM-Lab-7
Single variable function optimization.

## Chosen method: Fibonacci Search optimization
<b>The Fibonacci Search</b> optimization method is similar to <b>Golden Section</b> method,
but the ratio for the reduction of interval is not constant, instead it changes in optimal way.
Additionally, the number of iterations is predetermined based on the expected accuracy.

One of the downsides of this method is that, a number from Fibonacci Series
must be calculated in every iteration.

The section is reduced to

`[2 / F(N + 1)] * (upper_bound - lower_bound)`

which requires `n` iterations.


## Usage
To use this functionality you need to:
1. Run julia using `.../OM-Lab-7$ julia` in terminal
2. Press `]` to go into Pkg
3. Execute `activate FibonacciOptimization/`
4. Go back into julia and type `using FibonacciOptimization`
5. Now you can call `fibonacci_search`.

## Tests
To run tests:
You need to either follow Usage up to step 3, and then type `test`,
or just execute `.../OM-Lab-7$ julia run.jl`