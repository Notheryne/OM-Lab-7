module FibonacciOptimalisation

"A function to generate n-th number of fibonacci series"
function fibonacci(n)
    if n == 0
        return 0
    elseif n == 1 || n == 2
        return 1
    elseif n < 0
        error("n can't be negative'")
    else
        return fibonacci(n - 1) + fibonacci(n - 2)
    end
end


"""
A function to perform Fibonacci search.
Args: function, lower bound, upper bound
Keyword args: ε (wanted accuracy), n (number of iterations)
If both are passed, the passed number will be used, if none, ε = 10^(-4) is the default value.
"""
function fibonacci_search(f, a, b; ε=1e-4, n=0)
    k = 1
    if n == 0
        min_fib_n = (2 * (b - a)) / ε
        n = 0
        while fibonacci(n) < min_fib_n
            n += 1
        end
    end
    last_x = Inf
    last_f = Inf
    while k != n
        proportion = 1 - (fibonacci(n - k + 1)) / fibonacci(n - k + 2)
        l_k = proportion * (b - a)
        x1 = a + l_k
        x2 = b - l_k
        if last_x == x1
            f1 = last_f
            f2 = f(x2)
        elseif last_x == x2
            f1 = f(x1)
            f2 = last_f
        else
            f1 = f(x1)
            f2 = f(x2)
        end


        if f1 > f2
            a = x1
            last_f = f1
            last_x = x1
        else
            b = x2
            last_f = f2
            last_x = x2
        end
        k += 1
    end
    return last_x, last_f
end

export fibonacci_search

"""
julia> f1(x) = x^2
f1 (generic function with 1 method)

julia> f2(x) = x^2 + 3
f2 (generic function with 1 method)

julia> f3(x) = x^3 + x^2 + x
f3 (generic function with 1 method)

julia> f4(x) = x^4 - 14x^3 + 60x^2 - 70x
f4 (generic function with 1 method)

"""
end # module
