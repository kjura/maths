# include("ChapterThree/ProblemTwelve.jl")
# export plot_cdf, plot_pmf, cdf, pmf

function plot_pmf(rv_range)
    plt = plot()
    title!("PMF Problem 12")
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
    plot(range(-5, -2, length=1000), [0 for _ in range(length=1000)])
    plot!(range(-2, -1, length=1000), [0.2 for _ in range(length=1000)])
    plot!(range(-1, 0, length=1000), [0.5 for _ in range(length=1000)])
    plot!(range(0, 1, length=1000), [0.7 for _ in range(length=1000)])
    plot!(range(1, 2, length=1000), [0.9 for _ in range(length=1000)])
    plot!(range(2, 5, length=1000), [1 for _ in range(length=1000)])

    scatter!([-2], [0], markercolor=RGBA(1, 1, 1, 0), markersize=4)
    scatter!([-2], [0.2], markercolor="black", markersize=4)

    scatter!([-1], [0.2], markercolor=RGBA(1, 1, 1, 0), markersize=4)
    scatter!([-1], [0.5], markercolor="black", markersize=4)

    scatter!([0], [0.5], markercolor=RGBA(1, 1, 1, 0), markersize=4)
    scatter!([0], [0.7], markercolor="black", markersize=4)

    scatter!([1], [0.7], markercolor=RGBA(1, 1, 1, 0), markersize=4)
    scatter!([1], [0.9], markercolor="black", markersize=4)

    scatter!([2], [0.9], markercolor=RGBA(1, 1, 1, 0), markersize=4)
    scatter!([2], [1], markercolor="black", markersize=4)

    title!("CDF Problem 12")
    xlabel!("x")
    ylabel!("P(X <= x)")
end


# TODO - automate cdf creation, tricky iteration part
# function plot_cdf(rv_range, left_most_start)
#     plt = plot()

#     sorted_range = sort(rv_range)
#     push!(sorted_range, left_most_start)
#     push!(sorted_range, left_most_start)


#     for x in 2:length(sort!(rv_range))
#         plot!(
#             range(left_most_start, x, length=1000),
#             [pmf(x) for _ in range(length=1000)], 
#             color="black", 
#             legend=false
#             )
#     end
#     return plt
# end


function pmf(x)
    if x == -2
        return 0.2
    elseif x == -1
        return 0.3
    elseif x == 0
        return 0.2
    elseif x == 1
        return 0.2
    elseif x == 2
        return 0.1
    else
        return 0
    end
end


function cdf(x)
    if x < -2
        return 0
    elseif -2 <= x < -1
        return 0.2
    elseif  -1 <= x < 0
        return 0.5
    elseif 0 <= x < 1
        return 0.7
    elseif 1 <= x < 2
        return 0.9
    elseif x >= 2
        return 1
    else
        return 0
    end
end