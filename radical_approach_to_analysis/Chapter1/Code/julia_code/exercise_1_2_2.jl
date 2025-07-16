# /home/jakub/Coding/maths/radical_approach_to_analysis/Chapter1/Code/julia_code
module ChapterOne
using Revise
using Plots

# Function for exercise 1.2.2 a)
function fourier_series(n, x)
    constant_factor = 4 / π
    sum = 0
    for i in 1:n
        sum += ((-1)^(i-1) / (2*i - 1)) * cos(((2*i - 1) * π * x) / 2)
    end
    return constant_factor * sum
end


# point b) 100:100:2000
# plot_series_at_n(0.99, 100:100:2000)
# plot_series_at_n(0.999, 100:100:2000)
function plot_series_at_n(x, n_range)
    domain = [n for n in n_range]
    outputs = [fourier_series(n, x) for n in domain]
    scatter(domain, outputs)
    title!("Fourier series at x=$x")
    xlabel!("n")
    ylabel!("Fourier series at x=$x")
end

function plot_series_at_x(n, x_range)
    output = fourier_series.(n, x_range)
    plot(x_range, output)
end

# Chapter 2 Exercise 1.2.2 a)
# println(fourier_series(100, 0)) = 0.9968169807056898
# println(fourier_series(100, 0.5)) = 0.9954987558776579
# println(fourier_series(100, 0.9)) = 0.9796927699334861
# println(fourier_series(100, 0.99)) = 1.1789880778995547
# println(fourier_series(100, 1.1)) = -0.9796927699334861
# println(fourier_series(100, 2)) = -0.9968169807056898

# Chapter 2 Exercise 1.2.2 b)
# ChapterOne.plot_series_at_n(0.99, 100:100:2000)

# Chapter 2 Exercise 1.2.2 c)
# ChapterOne.plot_series_at_n(0.999, 100:100:2000)

# Chapter 2 Exercise 1.2.2 c)
# 


end

# include("exercise_1_2_2.jl")
