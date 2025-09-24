function fourier_series(n, x)
    constant_factor = 4 / π
    sum = 0
    for i in 1:n
        sum += ((-1)^(i-1) / (2*i - 1)) * cos(((2*i - 1) * π * x) / 2)
    end
    return constant_factor * sum
end


# approach_left(1000, [0.5, 0.6, 0.7, 0.8, 0.9, 0.91, 0.92, 0.93, 0.94, 0.95, 0.96, 0.97, 0.98, 0.99, 0.995])
function approach_left(n, xs)
    println("lim of f(x) as x approaches 1 from the left")
    println("Printing values  for arguments approaching 1 from left")
    for x in xs
        println("f($(x)) = $(fourier_series(n, x))")
    end
end

# approach_right(1000,[1.5, 1.4, 1.3, 1.2, 1.1, 1.09, 1.08, 1.07, 1.06, 1.05, 1.04, 1.03, 1.02, 1.01, 1.005])
function approach_right(n, xs)
    println("lim of f(x) as x approaches 1 from the right")
    println("Printing values  for arguments approaching 1 from right")
    for x in xs
        println("f($(x)) = $(fourier_series(n, x))")
    end
end


function value_at_x(n, x)
    println("The value of f($(x)) is: $(fourier_series(n, x))")
end