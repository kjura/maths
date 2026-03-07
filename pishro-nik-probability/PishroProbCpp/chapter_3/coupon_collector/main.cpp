#include "xoshiro.h"
#include <array>
#include <cstddef>
#include <iostream>
#include <cmath>
#include <string>
// #include <unordered_set>
// #include <array>
#include <random>
#include <chrono>
#include <vector>
#include <bitset>

using std::cout;

// g++ -std=c++20 -pedantic -Wall -Wextra -Werror -Wshadow -Wsign-conversion -g sandbox.cpp  -o sandbox
// g++ -std=c++20 -pedantic -Wall -Wextra -Wsign-conversion -g sandbox.cpp -o sandbox
// <br />
// PLACEHOLDEREXERCISENAME < input.txt > output.txt
// PLACEHOLDEREXERCISENAME ./exercise5 < input.txt >> output.txt
// Redirection in powershell  Get-Content .\input.txt | .\<YOUREXERCISENAME>>.exe
// using std::cout;
// using std::string;
// using std::vector;

// """Coupon collector's problem (Chapter 3 Exercise Twenty One)

// Suppose that there are N different types of coupons. 
// Each time you get a coupon, it is equally likely to be any of the N possible types. 
// Let X be the number of coupons you will need to get before having observed each coupon at least once.

// A. Show that you can write X = X0 + X1 + ... + XN-1, where Xi - Geometric( (N - i) / N)

// B. Find EX

// """
// function coupon(N, n_iter)
//     coupon_count = 0
//     rand_coupon_sequence = Set()
//     sizehint!(rand_coupon_sequence, N)
//     for _ in 1:n_iter
//         while length(rand_coupon_sequence) != N
//             random_c = rand(1:N)
//             coupon_count += 1
//             push!(rand_coupon_sequence, random_c)
//         end
//         empty!(rand_coupon_sequence)
//     end
//     return coupon_count / n_iter
//     # println("coupon_count / experiment = $(PishroProb.coupon(6, 1000000))")
// end



// double get_coupon_ev(const unsigned N, const unsigned n_iter) {
//     double coupon_count { 0.0 };
//     std::unordered_set<unsigned> container {  };
//     container.reserve(N);

//     std::random_device seed{};
//     std::mt19937 gen{seed()}; // seed the generator
//     std::uniform_int_distribution<unsigned> dist{1, N}; // set min and max

//     for (unsigned i = 1; i < n_iter; i++) {

//         unsigned cont_size { 0 }; 
//         while (cont_size != N) {
//             unsigned guess = dist(gen);
//             coupon_count += 1.0;
//             if (container.insert(guess).second) {
//                 cont_size += 1;
//             }
//         }

//         container.clear();
//     }

//     return coupon_count / n_iter;

// } 


// double get_coupon_ev(const size_t n_iter) {
//     size_t coupon_count { 0 };
//     size_t coupon_state[] { 0, 0, 0, 0, 0, 0 };
//     size_t coupon_occurence_uniqueness { 0 };
//     xso::rng gen;
//     std::uniform_int_distribution<unsigned int> dist{1, 6};

//     for (size_t i = 1; i < n_iter; i++) {

//         while (coupon_occurence_uniqueness != 6) {
//             size_t guess = dist(gen);
//             coupon_count += 1;
            
//             if (coupon_state[guess - 1] != 1) {
//                 coupon_state[guess - 1] = 1;
//                 coupon_occurence_uniqueness += 1;
//             }

//         }

//         coupon_occurence_uniqueness = 0;
//         std::fill(std::begin(coupon_state), std::end(coupon_state), 0);
//     }

//     return static_cast<double>(coupon_count) / n_iter;

// }

double get_coupon_ev(const size_t n_iter) {
    size_t coupon_count { 0 };
    std::bitset<6> bits_coupons { 0b000000 };
    xso::rng gen;
    std::uniform_int_distribution<long unsigned int> dist{1, 6};

    for (size_t i = 1; i < n_iter; i++) {

        while (!bits_coupons.all()) {
            size_t guess = dist(gen);
            coupon_count += 1;
            bits_coupons.set(guess - 1);
        }
        bits_coupons.reset();
    }
    return static_cast<double>(coupon_count) / n_iter;
}


int main()
{

    // std::bitset<6> bits_coupons { 0b000000 };

    // bits_coupons.set(3);
    // cout << bits_coupons << "\n";
    // bits_coupons.set(3);
    // bits_coupons.set(3);   
    // bits_coupons.set(3);   
    // bits_coupons.set(3);   
    // bits_coupons.set(3);   
    // bits_coupons.set(3);
    // bits_coupons.reset();
    // cout << bits_coupons << "\n";

    // std::cout << bits_coupons << "\n";

    // if (bits_coupons.all()) {
    //     cout << "All bits are true\n";
    // }
    // else {
    //     cout << "Some or all bits are false\n";
    // }



    auto start = std::chrono::steady_clock::now();
    auto output { get_coupon_ev(1000000) };
    auto end = std::chrono::steady_clock::now();
    auto diff = end - start;

    std::cout << "EX is " << output  << "\n";
    std::cout << std::chrono::duration<double, std::milli>(diff).count() << " ms" << std::endl;

    return 0;
}