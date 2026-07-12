using DataFrames

function rv_table()
    println("X │ 1 │ 2 │ 3 │ 4 │ 5 │ 6")
    println("───────────────────────────")
    for i in 1:7
        println("Y │ $(i) │ $(i) │ $(i) │ $(i) │ $(i) │ $(i)")
        println("───────────────────────────")
    end
    println("Y │ 0 │ 0 │ 0 │ 0 │ 0 │ 0")
end


function outcome_w()
    x_val = []
    y_val = []
    w_val = []
    for x in 1:6
        for y in 0:6
            push!(x_val, x)
            push!(y_val, y)

            if y == 0 || x == y
                push!(w_val, x)
            else
                push!(w_val, y)
            end
            
        end
    end
    
    return DataFrame(X=x_val, Y=y_val, W=w_val)

end


function pmf_W(k, omega::AbstractDataFrame)

    return size(omega[omega[!, :W] .== k, :])[1] / size(omega)[1]

end

function ex_W(omega::AbstractDataFrame)
    return sum([k * PishroProb.pmf_W(k, omega) for k in 1:6])
end

function ex_W(n)
    die = [1, 2, 3, 4, 5, 6]
    experiment = []
    for i in 1:n
        x = rand(die)
        if x < 4
            x = rand(die)
            push!(experiment, x)
        else
            push!(experiment, x)
        end
    end
    return sum(experiment) / n
end



# show(PishroProb.outcome_w(), allrows=true)
# P(W=1) = #W=1 / count