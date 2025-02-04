use std::f64::consts::PI;
use ndarray::linspace;
use plotly::{common::Mode, Layout, Plot, Scatter};

const PI_FACTOR: f64 = 4.0 / PI;

fn main() {
    
    let domain_step_size: usize = 1000;
    let lower_bound = -1.0;
    let upper_bound: f64 = 3.0;
    let n = 4;

    // for i in 1..2 {

    //     for x in [-1.0, 0.0, 1.0, 2.0, 3.0] {

    //         println!("{}", PI_FACTOR * coefficient(i) * (cosine_coefficient(i) * x).cos())

    //     }
    // }

    let furie = fourier_partial_sum(n, domain_step_size, lower_bound, upper_bound);
    println!("{:?}", furie);

    let mut haha = vec![];
    for i in linspace(lower_bound, upper_bound, domain_step_size){
        haha.push(i);
    };

    let trace2 = Scatter::new(haha, furie)
    .mode(Mode::Lines)
    .name("Lines");

    let plot_title = format!("Fourier partial sum for n={}", n);
    let layout = Layout::new().title(plot_title);
    let mut plot = Plot::new();
    plot.add_trace(trace2);
    plot.set_layout(layout);
    plot.show();

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

fn fourier_partial_sum(n: u8, domain_step_size: usize, lower_bound: f64, upper_bound: f64) -> Vec<f64> {
    
    let mut output_matrix: Vec<Vec<f64>> = Vec::new();
    for i in 1..n+1 {
        let domain= linspace(lower_bound, upper_bound, domain_step_size);
        let mut output = Vec::new();
        for x in domain {
            output.push(PI_FACTOR * coefficient(i) * (cosine_coefficient(i) * x).cos());
        }
        
        output_matrix.push(output);

    }

    sum_elementwise(output_matrix)

}