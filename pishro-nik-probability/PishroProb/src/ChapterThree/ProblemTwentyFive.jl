# Pishornik Chapter Three Exercise 25

# export median_geo, plot, plot_median_geo

"""
a.
"""

function pmf_a(k)
    if k == 1
        return 0.4
    elseif k == 2
        return 0.3
    elseif k == 3
        return 0.3
    else
        return 0
    end
end


"""
b.
"""

function median_geo(p, kind="ceiling")

    if !(0 < p <= 1)
       throw(DomainError(p, "Argument p must obey 0 < p <= 1")) 
    end

    if kind == "ceiling"
        return 1 / log2(1 / (1 - p))
    elseif kind == "floor"
        return 1 + (1 / log2(1 / (1 - p)))
    else
        throw(ArgumentError("""kind can only accept two argumenst "ceiling" or "floor", but the function received "$(kind)\"""")) 
    end
end

# plot_median_geo(range(0.1, 0.9, length=200))
function plot_median_geo(f_domain)
    y1 = median_geo.(f_domain, "ceiling")
    y2 = median_geo.(f_domain, "floor")
    
    p1 = plot(f_domain, y1, title="1 / log2(1 / q)", xlabel="q", ylabel="Value")
    p2 = plot(f_domain, y2, title="1 + (1 / log2(1 / q))", xlabel="q", ylabel="Value")
    plot(p1, p2, layout=(1, 2), legend=false)
end