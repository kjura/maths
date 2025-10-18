#include <iostream>
#include <cmath>
#include <iomanip>

using std::cout;

double get_series(int n, double x) {
    constexpr double my_pi { 3.141592653589793 };
    constexpr double const_factor { 4.0 /  my_pi};
    double sum { 0.0 };
    for (int i = 1; i < n + 1; i++) {
        sum += std::pow(-1, i-1)  / ( (2.0 * i) - 1.0) * std::cos(( (2.0 * i) - 1.0) * my_pi * x / 2.0);
    }

    return const_factor * sum;
}


int main() {
    
    cout << std::setprecision(15) << get_series(100, 0) << "\n";
    cout << std::setprecision(15) << get_series(100, 0.5) << "\n";
    cout << std::setprecision(15) << get_series(100, 0.9) << "\n";
    cout << std::setprecision(15) << get_series(100, 0.99) << "\n";
    cout << std::setprecision(15) << get_series(100, 1.1) << "\n";
    cout << std::setprecision(15) << get_series(100, 2) << "\n";

/* 
0.99681698070569
0.995498755877658
0.979692769933486
1.17898807789955
-0.979692769933486
-0.99681698070569    
*/


}