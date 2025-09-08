module ChapterThree


module ProblemOne
using Plots
function pmf(x)
    if x == 0
        return 1/ 2
    elseif x == 1
        return 1 / 3
    elseif x == 2
        return 1 / 6
    else
        return 0
    end
end

function cdf(t)
    if t < 0
        return 0
    elseif 0 <= t < 1
        return 1 / 2
    elseif 1 <= t < 2
        return 5 / 6
    else
        return 1
    end
end


function plot_distribution()
    # PishroProb.ChapterThree.ProblemOne.plot_distribution(range(0, 10, length=100))
    # x = domain
    # y = ProblemOne.cdf.(domain)
    # plot(x, y)
    plot(range(-5, 0, length=1000), [0 for _ in range(length=1000)])
    plot!(range(0, 1, length=1000), [1/2 for _ in range(length=1000)])
    plot!(range(1, 2, length=1000), [5/6 for _ in range(length=1000)])
    plot!(range(2, 5, length=1000), [1 for _ in range(length=1000)])

    scatter!([0], [0], markercolor=RGBA(1, 1, 1, 0), markersize=4)
    scatter!([0], [1/2], markercolor="black", markersize=4)

    scatter!([1], [1/2], markercolor=RGBA(1, 1, 1, 0), markersize=4)
    scatter!([1], [5/6], markercolor="black", markersize=4)

    scatter!([2], [5/6], markercolor=RGBA(1, 1, 1, 0), markersize=4)
    scatter!([2], [1], markercolor="black", markersize=4)


end
end

module ProblemFour
using IterTools
using PrettyTables

function rv_X(k)
    if k == 1
        return 1 / 4
    elseif k == 2
        return 1 / 8
    elseif k == 3
        return 1 / 8
    elseif  k == 4
        return 1 / 2
    else
        return 0
    end
end

function rv_Y(k)
    if k == 1
        return 1 / 6
    elseif k == 2
        return 1 / 6
    elseif k == 3
        return 1 / 3
    elseif  k == 4
        return 1 / 3
    else
        return 0
    end
end

# PishroProb.ChapterThree.ProblemFour.run()
function run()
    for (x, y) in product(1:5, 1:5)
        println("X=$x", " ", "Y=$y", " ", "P(X=$x)=$(rv_X(x))", " ", "P(Y=$y)=$(rv_Y(y))", " ", "?P(X < Y)? = $(rv_X(x) < rv_Y(y))")
    end
end

# PishroProb.ChapterThree.ProblemFour.rv_table()
function rv_table()

    xs = []
    ys = []
    pmf_xs = []
    pmf_ys = []

    for (x, y) in product(1:5, 1:5)
        push!(xs, x)
        push!(ys, y)
        push!(pmf_xs, rv_X(x))
        push!(pmf_ys, rv_Y(y))
    end

    # println(xs)
    # println(ys)
    # println(pmf_xs)
    # println(pmf_ys)

    data = hcat(xs, ys, pmf_xs, pmf_ys)
    println(data)
    # for (x, y) in pairs
    #     append!(data, [x, y, rv_X(x), rv_Y(y)])
    # end
    # data = hcat(pmf_x, pmf_y)
    column_labels = [
        "x", "y", "P(X=x)", "P(Y=y)"
    ]

    pretty_table(
    data;
    column_labels = column_labels,
    style = TextTableStyle(;
        first_line_column_label = crayon"bold yellow",
    )
    )

end


end
end