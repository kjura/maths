
# a. P(X = 1), P(X = 2), P(X = 3)
# pmf_X(1)
# pmf_X(1) + pmf_X(1)
# pmf_X(1) + pmf_X(2) + pmf_X(3)

# b. The general PMF
function pmf_X(k)
    (0.5^((k - 1) * k / 2)) * (1 - (0.5^(k)))
end


# c. More than two tests
# Pr = 0.125
function pr_more_than_two_tests()
    return 1 - sum([pmf_X(1), pmf_X(2)])
end


# d. Given that you take the test more than once,
# find the probability that you take the test exactly twice.
# Pr = 0.75

function pr_two_tests_given_test_taken_more_than_once()
    return pmf_X(2) / (1 - pmf_X(1))
end
