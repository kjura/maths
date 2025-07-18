module ChapterTwo

module ProblemThirteen


function get_pr_bernoulli_trial(n, k, p)
    return binomial(n, k) * p^(k) * ((1 - p)^(n-k))
end

function pr_at_least_three_heads_given_coin_type(trials, pr_coin_type)
    get_pr_bernoulli_trial(trials, 3, pr_coin_type) + 
    get_pr_bernoulli_trial(trials, 4, pr_coin_type) + 
    get_pr_bernoulli_trial(trials, 5, pr_coin_type) * 
    0.5
end

function pr_at_least_three_heads(pr_chosen_coin_1, pr_chosen_coin_2, trials)
    pr_given_coin_1 = pr_at_least_three_heads_given_coin_type(trials, pr_chosen_coin_1)
    pr_given_coin_2 = pr_at_least_three_heads_given_coin_type(trials, pr_chosen_coin_2)

    return pr_given_coin_1 + pr_given_coin_2
end

function pr_at_least_three_heads_given_coin(trials, pr_coin_type)
    pr_sum = 0
    for k in 3:trials
        pr_sum += binomial(trials, k) * (pr_coin_type)^(k) * (1 - pr_coin_type)^(trials - k)
    end
    return 0.5 * pr_sum
end

end

end