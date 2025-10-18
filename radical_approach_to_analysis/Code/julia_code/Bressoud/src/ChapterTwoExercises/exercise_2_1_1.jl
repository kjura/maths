
# include("ChapterTwoExercises/exercise_2_1_1.jl")
# export generate_numerical_vertices, generate_vertices, create_kth_vertex, plot_vertices

function generate_numerical_vertices(n)
    for k in 0:(2^n)
        println("($(-1 + k * 2.0^(-n)), $(1 - (-1 + k * 2.0^(-n))^(2)))")
    end
end


function create_kth_vertex(k, n)
    return (-1 + k * 2.0^(-n), 1 - (-1 + k * 2.0^(-n))^(2))
end

function generate_vertices(n)
    for k in 0:(2^n)
        first_coordinate = "-1 + $(k) * 2^($(-n))"
        second_coordinate = "1 - (-1 + $(k) * 2^$(-n))^2"
        println("($(first_coordinate), $(second_coordinate))")
    end
end


function plot_vertices(n)
    xs = [-1 + (k * 2.0^(-n)) for k in 0:(2 * 2^(n))]
    ys = [1 - (-1 + (k * 2.0^(-n)))^(2) for k in 0:(2 * 2^(n))]
    # points = [create_kth_vertex(k, n) for k in 0:2^(n)]
    plot(xs, ys)
    # println(xs)
    # println(ys)
end