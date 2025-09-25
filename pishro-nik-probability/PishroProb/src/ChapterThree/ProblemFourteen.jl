function generate_latex_expectation_formula(support, prs)
    tex_sum = "EX = "
    for (x, pr) in zip(support, prs)
        tex_sum *= "(" * string(x) * " \\" * "cdot " * string(pr) * ")" * " + "
    end
    println(rstrip(tex_sum)[1:end-1])
end


function get_ev(support, prs)
    ev_sum = 0
    for (x, pr) in zip(support, prs)
        ev_sum += x * pr
    end
    return ev_sum
end