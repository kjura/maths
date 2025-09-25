# F(x) = 1 - (1 - p)^(x) for integers
function cdf_geo(p, x)
    return 1 - (1 - p)^(x)
end

# P(X > m + l | X > m)
function pr_shift_given_more_than_m_trials(m, l, p)
    (1 - cdf_geo(p, m + l)) /  1 - cdf_geo(p, m)
end

# P(X > l)
function pr_no_shift_more_than_l_trials(l, p)
    return (1 - p)^(l)
end

# P(X > m + l | X > m) = P(X > l)
function plot_pr_no_shift_more_than_l_trials(l, n, p)
    scatter(l:(l + n), pr_no_shift_more_than_l_trials.(l:(l + n), p))
end