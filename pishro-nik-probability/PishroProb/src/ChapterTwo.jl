module ChapterTwo

module ProblemThirteen
export pr_at_least_n_coin_sides_given_coin_type, pr_total_atl_three_heads

function pr_at_least_n_coin_sides_given_coin_type(successes, trials, pr_success)
    sum = 0
    for k in successes:trials
        sum += binomial(trials, k) * pr_success^(k) * (1 - pr_success)^(trials - k)
    end
    return sum
end

function pr_total_atl_three_heads(pr_at_least_three_heads_coin_one, pr_at_least_three_heads_coin_two)
    return (1/2) * pr_at_least_three_heads_coin_one + (1/2) * pr_at_least_three_heads_coin_two
end

# Solve problem 13 a)
# pr_atl_three_heads_given_coin_one = PishroProb.ChapterTwo.ProblemThirteen.pr_at_least_n_coin_sides_given_coin_type(3, 5, (1/2))
# pr_atl_three_heads_given_coin_two = PishroProb.ChapterTwo.ProblemThirteen.pr_at_least_n_coin_sides_given_coin_type(3, 5, (1/3))
# pr_total = PishroProb.ChapterTwo.ProblemThirteen.pr_total_atl_three_heads(pr_atl_three_heads_given_coin_one, pr_atl_three_heads_given_coin_two)

# Solve problem 13 b)
# pr_coin_two_given_atl_three_h = 0.5 * pr_atl_three_heads_given_coin_two / PishroProb.ChapterTwo.ProblemThirteen.pr_total_atl_three_heads(pr_atl_three_heads_given_coin_one, pr_atl_three_heads_given_coin_two)

end
end