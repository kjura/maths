#include <iostream>
#include <cmath>
#include <vector>
#include <string>
#include <iterator>
#include <random>
#include <algorithm>
#include <array>
#include <unordered_map>
#include <chrono>

using std::cout;
using std::vector;
using std::string;
using std::chrono::high_resolution_clock;
using std::chrono::duration_cast;
using std::chrono::duration;
using std::chrono::milliseconds;


/* 

Problem 
I have two bags. Bag 1 contains 10
 blue marbles, while Bag 2 contains 15
 blue marbles. I pick one of the bags at random, and throw 6
 red marbles in it. Then I shake the bag and choose 5
 marbles (without replacement) at random from the bag. If there are exactly 2
 red marbles among the 5
 chosen marbles, what is the probability that I have chosen Bag 1?

    P(B_{1} | R)

*/


int main() {


    vector<string> bag_1(10, "BLUE");
    vector<string> bag_2(15, "BLUE");
    vector<vector<string>> drawing_container {bag_1, bag_2};

    std::mt19937 generator(std::random_device{}());
    std::uniform_int_distribution<std::size_t> distribution(0, drawing_container.size() - 1);
    std::size_t chosen_bag_index = distribution(generator);
    vector<string> chosen_bag { drawing_container[ chosen_bag_index] };

    string bag_name {"TEMPORARY"};
    if (chosen_bag.size() == 10) { bag_name = "BAG_1"; } else { bag_name = "BAG_2"; }

    // Add 6 red marbles to the bag
    for (int i=0; i < 6; ++i) {chosen_bag.push_back("RED");}
    std::shuffle(chosen_bag.begin(), chosen_bag.end(), generator);

    vector<string> sample_without_replacement {};
    std::sample(chosen_bag.begin(), chosen_bag.end(), std::back_inserter(sample_without_replacement), 5, generator);

    return 0;


}