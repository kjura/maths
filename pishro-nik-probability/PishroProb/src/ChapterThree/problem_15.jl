# include("ChapterThree/problem_15.jl")
# export plot_pmf, pmf_Y, pmf_X, cdf_X

function plot_pmf(rv_range; plot_title="PMF Problem 15", x_label_title="y", y_label_title="P(Y = y)", pmf_function=pmf_Y)
    plt = plot()
    title!(plot_title)
    xlabel!(x_label_title)
    ylabel!(y_label_title)
    for x in rv_range
        scatter!([x], [pmf_function(x)], markercolor="black", markersize=4, legend=false)
        plot!([x, x], [0, pmf_function(x)], color="black", legend=false)
    end
    return plt
end


function pmf_Y(y)
    if y == 0
        return 16 / 243
    elseif y in [1, 2, 3, 4]
        return (1/3) * (2 / 3)^(4 - y) + (1/3) * (2 / 3)^(4 + y)
    elseif y == 5
        return 512 / 59049
    elseif y >= 6
        return (1/3) * (2 / 3)^(4 + y)
    else
        return 0
    end
end


function pmf_X(x)
    if x >= 1
        return (1/3) * (2/3)^(x - 1)
    else
        return 0
    end
end

function cdf_X(x; p=(1/3))
    if x >= 1
        return 1 - (1 - p)^(floor(x))
    else
        return 0
    end
end

# plot_pmf(X_range, x_label_title="x", y_label_title="P(X=x)", pmf_function=pmf_X)