use std::f64::consts::PI;

use ndarray::linspace;

const PI_FACTOR: f64 = PI / 4.0;

fn main() {
    
    let furie = fourier_partial_sum(4);

    println!("{:?}", furie);

}

fn sum_elementwise(output_matrix: Vec<Vec<f64>>) -> Vec<f64> {

    let row_length = output_matrix[0].len();

    // if row_length > 1 {
    //     println!("Length of row_length is: {}", row_length);
    //     return vec![-1.0f64];
    // }
    // Output mut vector filled with zero, 1-d, length equal to row_length
    // We're gonna iterate over every position in vector<vector> and sum elementwise positions
    // so we starting with [0, 0, 0, 0, ..., 0]
    let mut result = vec![0f64; row_length];

    for v in output_matrix {

        for (i, &v) in v.iter().enumerate() {
            result[i] += v;
        }
    }

    result

}

fn coefficient(n: u8) -> f64 {
    (-1.0f64).powi((n-1).into()) / ((2*n) - 1) as f64
}

fn cosine_coefficient(n: u8) -> f64 {
    ((2.0 * n as f64) - 1.0) * PI  / 2.0
}

fn fourier_partial_sum(n: u8) -> Vec<f64> {
    
    let mut output_matrix: Vec<Vec<f64>> = Vec::new();
    for i in 1..n {
        let domain= linspace(-1.0, 3.0, 50);
        let mut output = Vec::new();
        for x in domain {
            output.push(PI_FACTOR * coefficient(i) * (cosine_coefficient(i) * x).cos());
        }
        
        output_matrix.push(output);

    }

    sum_elementwise(output_matrix)

}