
# include("ChapterTwoExercises/exercise_2_1_1.jl")
# export generate_numerical_vertices, generate_vertices

function generate_numerical_vertices(n)
    for k in 0:(2^n)
        println("($(-1 + k * 2.0^(-n)), $(1 - (-1 + k * 2.0^(-n))^(2)))")
    end
end


function generate_vertices(n)
    for k in 0:(2^n)
        first_coordinate = "-1 + $(k) * 2^($(-n))"
        second_coordinate = "1 - (-1 + $(k) * 2^$(-n))^2"
        println("($(first_coordinate), $(second_coordinate))")
    end
end