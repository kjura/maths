
# Function for exercise 1.2.2 a)
function fourier_series(n, x)
    constant_factor = 4 / π
    sum = 0
    for i in 1:n
        sum += ((-1)^(i-1) / (2*i - 1)) * cos(((2*i - 1) * π * x) / 2)
    end
    return constant_factor * sum
end


# point b)
# Bressoud.plot_series_at_n(0.99, 100:100:2000, "Exercise 1.2.2 b.")

# point c)
# Bressoud.plot_series_at_n(0.999, 100:100:2000, "Exercise 1.2.2 c.")
function plot_series_at_n(x, n_range, exercise_title)
    domain = [n for n in n_range]
    outputs = [fourier_series(n, x) for n in domain]
    scatter(domain, outputs)
    title!("$(exercise_title) Fourier series at x=$x")
    xlabel!("n")
    ylabel!("Fourier series at x=$x")
end

function plot_series_at_x(n, x_range)
    output = fourier_series.(n, x_range)
    plot(x_range, output)
end

# Bressoud.print_exercises_results()
function print_exercises_results()
    println("Exercise 1.2.2 a.")
    println("F_100(0) = $(round(fourier_series(100, 0), digits=6))")
    println("F_100(0.5) = $(round(fourier_series(100, 0.5), digits=6))")
    println("F_100(0.9) = $(round(fourier_series(100, 0.9), digits=6))")
    println("F_100(0.99) = $(round(fourier_series(100, 0.99), digits=6))")
    println("F_100(1.1) = $(round(fourier_series(100, 1.1), digits=6))")
    println("F_100(2) = $(round(fourier_series(100, 2), digits=6))")
    println()
    println("Exercise 1.2.2 b.")
    for n in 100:100:2000
        println("F_$(n)(0.99) = $(round(fourier_series(n, 0.99), digits=6))")
    end
    println()
    println("Exercise 1.2.2 c.")
    for n in 100:100:2000
        println("F_$(n)(0.99) = $(round(fourier_series(n, 0.999), digits=6))")
    end
    println()
    println("Skipping Exercise 1.2.2 d. Not clear enough at this point")
end

# Bressoud.print_tex_equation_helper()
function print_tex_equation_helper()
    for n in 100:100:2000
        println("\\begin{equation*}")
        println("    F_{$(n)}(0.999) = $(round(fourier_series(n, 0.999), digits=6))")
        println("\\end{equation*}")
    end
end