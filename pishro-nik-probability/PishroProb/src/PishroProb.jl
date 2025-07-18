# julia --project=.
module PishroProb
using Revise
include("ChapterTwo.jl")

# solution_a = PishroProb.ChapterTwo.ProblemThirteen.pr_at_least_three_heads((1/2), (1/3), 5)
# solution_b = PishroProb.ChapterTwo.ProblemThirteen.pr_coin_2_given_three_heads()
# (get_pr_bernoulli_trial(trials, 3, pr_chosen_coin_2) + get_pr_bernoulli_trial(trials, 4, pr_chosen_coin_2) + get_pr_bernoulli_trial(trials, 5, pr_chosen_coin_2))

end # module PishroProb
