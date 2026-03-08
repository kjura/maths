#include <iostream>
#include <cmath>
#include <vector>
#include <string>
#include <chrono>

using std::cout;
using std::vector;
using std::string;
using std::chrono::high_resolution_clock;
using std::chrono::milliseconds;


double expected_value_petersburg(int N) {
    double sum = 0;
    for (int k = 1; k < N; k++) {
        sum += 1;
    }
    return 0.5 * sum;
}

double expected_value_petersburg_finite_casino(int N) {

    double sum_lhs = expected_value_petersburg(30);

    double casino_max = pow(2, 30);
    double sum_rhs { 0.0 };
    for (int k = 31; k < N; ++k) {
        
        sum_rhs += pow(0.5, k-1);
    }

    return sum_lhs + (casino_max * sum_rhs);

}


double pr_greater_than(double t) {
    
    vector<int> rv_rng { };
    for (int k = 1; pow(2, k - 1) < t; k++) {
        rv_rng.push_back(k);
    }

    double pr_sum { 0.0 };
    for (const auto k : rv_rng) {
        pr_sum += pow(0.5, k);
    }

    return 1 - pr_sum;
}

int main() {


    // cout << "EX(10) = " << expected_value_petersburg(10) << "\n";
    // cout << "EX(100) = " << expected_value_petersburg(100) << "\n";
    // cout << "EX(1000) = " << expected_value_petersburg(1000) << "\n";
    // cout << "EX(10000) = " << expected_value_petersburg(10000) << "\n";
    // cout << "EX(100000) = " << expected_value_petersburg(100000) << "\n";
    // cout << "EX(1000000) = " << expected_value_petersburg(1000000) << "\n";


    // cout << "P(X > 65) = " << pr_greater_than(65) << "\n"; // Should be 1/128 = 0.0078125


    cout << "EY(1000000) = " << expected_value_petersburg_finite_casino(100000000) << "\n";

    return 0;

}