using FibonacciOptimalisation, Test

@testset "fibonacci with accuracy" begin
    lower_bound, upper_bound = -1, 1
    func, accuracy = x -> x^2, 0.1
    true_x, true_f = 0, 0
    x, f = fibonacci_search(func, lower_bound, upper_bound, accuracy=accuracy)
    @test abs(x - true_x) < accuracy && abs(f - true_f) < accuracy

    lower_bound, upper_bound = 0, 1
    func, accuracy = x -> x^4 - 14x^3 + 60x^2 - 70x, 0.001
    true_x, true_f = 0.780884, -24.3696
    x, f = fibonacci_search(func, lower_bound, upper_bound, accuracy=accuracy)
    @test abs(x - true_x) < accuracy && abs(f - true_f) < accuracy

    lower_bound, upper_bound = pi, 2 * pi
    func, accuracy = x -> sin(x), 1e-4
    true_x, true_f = 1.5 * pi, -1
    x, f = fibonacci_search(func, lower_bound, upper_bound) # test default accuracy
    @test abs(x - true_x) < accuracy && abs(f - true_f) < accuracy
end

@testset "fibonacci with iteration number" begin
    lower_bound, upper_bound = -1, 1
    func, iter_num = x -> x^2, 5
    expected_x, expected_f = 0, 0
    @test fibonacci_search(func, lower_bound, upper_bound, iterations=iter_num) == (expected_x, expected_f)

    lower_bound, upper_bound = -2, 2
    func, iter_num = x -> x^4 - 14x^3 + 60x^2 - 70x, 12
    expected_x, expected_f = 0.781115879828326, -24.369599908878634
    @test fibonacci_search(func, lower_bound, upper_bound, iterations=iter_num) == (expected_x, expected_f)

    lower_bound, upper_bound = -5, -3
    func, iter_num = x -> sin(x) * cos(x), 25
    expected_x, expected_f = -3.926989200365754, -0.49999999999738654
    @test fibonacci_search(func, lower_bound, upper_bound, iterations=iter_num) == (expected_x, expected_f)

end