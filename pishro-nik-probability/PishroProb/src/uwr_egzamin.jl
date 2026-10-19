using Revise


function f(x) 

    return x^(1/4) - ((x + 114) / 65)

end


function dfdx(x)

    return (1 / (4 * ((x^3)^(1/4)))) - (1/65)

end


function plot_functions(from=16, to=81, interval_length=100)

    domain = range(from, to, length=interval_length)

    root_of_y2 = (65 * 65^(1/3)) / (4 * 2^(2/3))

    roots_of_f = [16, 81]

    y1 = f.(domain)
    y2 = dfdx.(domain)
    plot(domain, [y1 y2], title="f(x) and f'(x) plot", label=["f(x)" "f'(x)"])
    scatter!([root_of_y2], [0], label="Zero of dfdx")
    scatter!([roots_of_f[1]], [0], label="First zero of f")
    scatter!([roots_of_f[2]], [0], label="Second zero of f")

end

# range(16, 81, length=100)
# plot(range(16, 81, length=100), dfdx.(range(16, 81, length=100)))
# plot(range(16, 81, length=100), f.(range(16, 81, length=100)))