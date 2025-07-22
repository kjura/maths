#include <iostream>
#include <cmath>

using std::cout;


// g++ -std=c++20 -pedantic -Wall -Wextra -Werror -Wshadow -Wsign-conversion -g exercise_13.cpp  -o exercise_13
// g++ -std=c++20 -pedantic -Wall -Wextra -Wsign-conversion -g sandbox.cpp -o sandbox
// <br />
// PLACEHOLDEREXERCISENAME < input.txt > output.txt
// PLACEHOLDEREXERCISENAME ./exercise5 < input.txt >> output.txt
// Redirection in powershell  Get-Content .\input.txt | .\<YOUREXERCISENAME>>.exe

double comb_t(double n, double k) {
        return std::tgamma(n + 1) / std::tgamma(k + 1) / std::tgamma(n - k + 1);
}


double pr_at_least_n_coin_sides_given_coin_type(unsigned succcess, unsigned trials, double pr_success) {

    double sum { 0.0 };
    for (unsigned k = succcess; k <= trials; ++k) {
        sum += comb_t(5, k) * pow(pr_success, k) * pow((1 - pr_success), (trials - k));
    }

    return sum;


}

double pr_total_atl_three_heads(double pr_at_least_three_heads_coin_one, double pr_at_least_three_heads_coin_two) {
    return (1.0 / 2.0) * pr_at_least_three_heads_coin_one + (1.0 / 2.0) * pr_at_least_three_heads_coin_two;
}

int main() {

    unsigned successes { 3 };
    unsigned trials { 5 };
    double pr_succcess_coin_one { 0.5 };
    double pr_succcess_coin_two { 1.0 / 3.0 };


    double pr_atl_three_heads_given_coin_one = pr_at_least_n_coin_sides_given_coin_type(successes, trials, pr_succcess_coin_one);
    double pr_atl_three_heads_given_coin_two = pr_at_least_n_coin_sides_given_coin_type(successes, trials, pr_succcess_coin_two);
    double pr_total = pr_total_atl_three_heads(pr_atl_three_heads_given_coin_one, pr_atl_three_heads_given_coin_two);

    double pr_coin_two_given_atl_three_h = 0.5 * pr_atl_three_heads_given_coin_two / pr_total_atl_three_heads(pr_atl_three_heads_given_coin_one, pr_atl_three_heads_given_coin_two);

    cout << "P(at least three heads) = " << pr_total << "\n";
    cout << "P(Coin 2 | at least three heads) = " << pr_coin_two_given_atl_three_h << "\n";


}