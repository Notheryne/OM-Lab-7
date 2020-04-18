module FibonacciOptimalisation

"A function to generate n-th number of fibonacci series"
function fibonacci(n)
    if n == 0
        return 0
    elseif n == 1 || n == 2
        return 1
    elseif n < 0
        error("n can't be negative. Your argument: ", n, ".")
    else
        return fibonacci(n - 1) + fibonacci(n - 2)
    end
end


"""
Functions optimizes single variable function using Fibonacci search.
Args: function, lower bound, upper bound
Keyword args: accuracy (wanted accuracy), iterations (number of iterations to be performed)
If both are passed, the passed number will be used, if none, accuracy = 10^(-4) is the default value.
"""

function fibonacci_search(func, lower_bound, upper_bound; accuracy=1e-4, iterations=0)
    if lower_bound > upper_bound
        error("Wrong interval specified. Shouldn't it be (", upper_bound, ", ", lower_bound, ") instead?")
    end
    if iterations == 0
        min_fib_n = (2 * (upper_bound - lower_bound)) / accuracy
        iterations = 0
        while fibonacci(iterations) < min_fib_n
            iterations += 1
        end
    end
    iteration = 1
    last_x = Inf
    last_f = Inf
    while iteration != iterations
        proportion = 1 - (fibonacci(iterations - iteration + 1)) / fibonacci(iterations - iteration + 2)
        l_k = proportion * (upper_bound - lower_bound)
        x1 = lower_bound + l_k
        x2 = upper_bound - l_k

        if last_x == x1
            f1 = last_f
            f2 = func(x2)
        elseif last_x == x2
            f1 = func(x1)
            f2 = last_f
        else
            f1 = func(x1)
            f2 = func(x2)
        end


        if f1 > f2
            lower_bound = x1
            last_f = f1
            last_x = x1
        else
            upper_bound = x2
            last_f = f2
            last_x = x2
        end
        iteration += 1
    end
    return last_x, last_f
end

export fibonacci_search


end # module
