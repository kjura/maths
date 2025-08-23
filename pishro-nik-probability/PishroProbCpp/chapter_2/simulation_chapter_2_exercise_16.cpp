#include <iostream>
#include <cmath>
#include <vector>
#include <string>
#include <iterator>
#include <random>
#include <algorithm>
#include <unordered_map>
#include <chrono>

using std::cout;
using std::vector;
using std::string;
using std::chrono::high_resolution_clock;
using std::chrono::duration_cast;
using std::chrono::duration;
using std::chrono::milliseconds;

// g++ -O3 -std=c++20 -pedantic -Wall -Wextra -Werror -Wshadow -Wsign-conversion -g simulation_chapter_2_exercise_16.cpp  -o simulation_chapter_2_exercise_16
// g++ -std=c++20 -pedantic -Wall -Wextra -Wsign-conversion -g simulation_chapter_2_exercise_16.cpp -o simulation_chapter_2_exercise_16

std::unordered_map<std::string, int> count_items(vector<string>& vec) {

    int red { 0 };
    int blue { 0 };

    for (string& card : vec) {
        if (card == "RED") {
            ++red;
        }
        else {
            ++blue;
        }
    }

    return std::unordered_map<std::string, int> {{"RED", red}, {"BLUE", blue}};

}


template<typename T>
void print_container(T& container) {
    for (auto& e: container) {
        cout << e << " ";
    }
    cout << "\n";
}


int main() {


    // Helper lambda function to print key-value pairs
    // auto print_key_value = [](const auto& key, const auto& value)
    // {
    //     std::cout << "Key:[" << key << "] Value:[" << value << "]\n";
    // };
    auto t1 = high_resolution_clock::now();
    int total_samples { 0 };
    int event { 0 };  
    int n { 100000000 };
    std::random_device rd;
    std::mt19937 g(rd());

    for(int i { 0 }; i < n; i++) {

        vector<string> cards {
            "RED", "RED", "RED", "RED", "RED", "RED", "RED", "RED", "RED", "RED",
            "BLUE", "BLUE", "BLUE", "BLUE", "BLUE", "BLUE", "BLUE", "BLUE", "BLUE", "BLUE"
        };
        std::shuffle(cards.begin(), cards.end(), g);

        vector<string> event_space(cards.begin(), cards.begin() + 15);
        auto counter = count_items(event_space);

        counter.try_emplace("RED", 0);
        counter.try_emplace("BLUE", 0);

        if ((counter["RED"] == 10) and (counter["BLUE"] == 5)) {
            ++event;
            ++total_samples;
        }
        else {
            ++total_samples;
        }

        
    }
    auto t2 = high_resolution_clock::now();
    /* Getting number of milliseconds as an integer. */
    auto ms_int = duration_cast<milliseconds>(t2 - t1);
    /* Getting number of milliseconds as a double. */
    duration<double, std::milli> ms_double = t2 - t1;

    std::cout << ms_int.count() << "ms\n";
    std::cout << ms_double.count() << "ms\n";

    cout << "Total samples: " << total_samples << "\n";
    cout << "Event samples: " << event << "\n";
    cout << "Pr(All red cards are assigned numbers less than or equal to 15): " << static_cast<double>(event) / static_cast<double>(total_samples) << "\n";

}    
