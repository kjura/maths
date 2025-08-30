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



end