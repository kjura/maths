use num_integer::binomial;


pub fn pr_at_least_n_coin_sides_given_coin_type(successes: u8, trials: u8, pr_success: f64) -> f64 {
        let mut sum = 0.0;
        for k in successes..=trials {
            sum += binomial(trials, k) as f64 * f64::powf(pr_success, k as f64) * f64::powf(1.0 - pr_success, (trials - k) as f64) 
        }
        sum
}


pub fn pr_total_atl_three_heads(pr_at_least_three_heads_coin_one: f64, pr_at_least_three_heads_coin_two: f64) -> f64 {
    (1.0 / 2.0) * pr_at_least_three_heads_coin_one + (1.0 / 2.0) * pr_at_least_three_heads_coin_two
}


pub fn solve_exercise_thirteen() {
    let successes: u8 = 3;
    let trials: u8 = 5;
    let pr_success_coin_one = 0.5;
    let pr_success_coin_two = 1.0 / 3.0;

    let pr_atl_three_heads_given_coin_one = pr_at_least_n_coin_sides_given_coin_type(successes, trials, pr_success_coin_one);
    let pr_atl_three_heads_given_coin_two = pr_at_least_n_coin_sides_given_coin_type(successes, trials, pr_success_coin_two);
    let pr_total = pr_total_atl_three_heads(pr_atl_three_heads_given_coin_one, pr_atl_three_heads_given_coin_two);

    let pr_coin_two_given_atl_three_h = 
        0.5 * 
        pr_atl_three_heads_given_coin_two / 
        pr_total_atl_three_heads(pr_atl_three_heads_given_coin_one, pr_atl_three_heads_given_coin_two);

    println!("P(at least three heads) = {pr_total}");
    println!("P(Coin 2 | at least three heads) = {pr_coin_two_given_atl_three_h}");
}