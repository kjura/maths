# include("ChapterThree/ProblemThirteen.jl")
# export plot_pmf, plot_cdf, pmf, cdf

function plot_pmf(rv_range)
    plt = plot()
    title!("PMF Problem 13")
    xlabel!("x")
    ylabel!("P(X = x)")
    for x in rv_range
        scatter!([x], [pmf(x)], markercolor="black", markersize=4, legend=false)
        plot!([x, x], [0, pmf(x)], color="black", legend=false)
    end
    return plt
end

function plot_cdf()
    default(legend = false)
    plot(range(-5, 0, length=1000), [0 for _ in range(length=1000)])
    plot!(range(0, 1, length=1000), [1 / 6 for _ in range(length=1000)])
    plot!(range(1, 2, length=1000), [1 / 2 for _ in range(length=1000)])
    plot!(range(2, 3, length=1000), [3 / 4 for _ in range(length=1000)])
    plot!(range(3, 5, length=1000), [1 for _ in range(length=1000)])

    scatter!([0], [0], markercolor=RGBA(1, 1, 1, 0), markersize=4)
    scatter!([0], [1 / 6], markercolor="black", markersize=4)

    scatter!([1], [1 / 6], markercolor=RGBA(1, 1, 1, 0), markersize=4)
    scatter!([1], [1 / 2], markercolor="black", markersize=4)

    scatter!([2], [1 / 2], markercolor=RGBA(1, 1, 1, 0), markersize=4)
    scatter!([2], [3 / 4], markercolor="black", markersize=4)

    scatter!([3], [3 / 4], markercolor=RGBA(1, 1, 1, 0), markersize=4)
    scatter!([3], [1], markercolor="black", markersize=4)

    title!("CDF Problem 13")
    xlabel!("x")
    ylabel!("P(X <= x)")
end


function pmf(x)
    if x == 0
        return 1 / 6
    elseif x == 1
        return 1 / 3
    elseif x == 2 || x == 3
        return 1 / 4
    else
        return 0
    end
end


function cdf(x)
    if x < 0
        return 0
    elseif 0 <= x < 1
        return 1 / 6
    elseif  1 <= x < 2
        return 1 / 2
    elseif 2 <= x < 3
        return 3 / 4
    elseif x >= 3
        return 1
    else
        return 0
    end
end