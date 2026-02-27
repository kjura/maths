"""Coupon collector's problem (Chapter 3 Exercise Twenty One)

Suppose that there are N different types of coupons. 
Each time you get a coupon, it is equally likely to be any of the N possible types. 
Let X be the number of coupons you will need to get before having observed each coupon at least once.

A. Show that you can write X = X0 + X1 + ... + XN-1, where Xi - Geometric( (N - i) / N)

B. Find EX

"""

function coupon(N, n_iter)
    coupon_count = 0
    rand_coupon_sequence = Set()
    sizehint!(rand_coupon_sequence, N)
    for _ in 1:n_iter
        while length(rand_coupon_sequence) != N
            random_c = rand(1:N)
            coupon_count += 1
            push!(rand_coupon_sequence, random_c)
        end
        empty!(rand_coupon_sequence)
    end
    return coupon_count / n_iter
    # println("coupon_count / experiment = $(PishroProb.coupon(6, 1000000))")
end


function expected_value(coupon_count) 

    return sum([coupon_count / (coupon_count - i) for i in 1:(coupon_count - 1)])

end