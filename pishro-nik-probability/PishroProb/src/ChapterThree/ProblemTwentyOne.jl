"""Coupon collector's problem (Chapter 3 Exercise Twenty One)

Suppose that there are N different types of coupons. 
Each time you get a coupon, it is equally likely to be any of the N possible types. 
Let X be the number of coupons you will need to get before having observed each coupon at least once.

A. Show that you can write X = X0 + X1 + ... + XN-1, where Xi - Geometric( (N - i) / N)

B. Find EX

"""

function coupon(N, n_iter)

    coupon_kind = [i for i in 1:N]
    total = 0
    rounds = 0
    
    for round in 1:n_iter
        coupon_count = 0
        rand_coupon_sequence = Set()
        # println("Trial number ($round)")
        rounds += 1
        while true
            random_c = rand(coupon_kind)
            coupon_count += 1
            if random_c in rand_coupon_sequence
                # print(random_c, " ")
                continue
            else
                push!(rand_coupon_sequence, random_c)
                # print(random_c, " ")
            end

            if rand_coupon_sequence == Set(coupon_kind)
                break
            end
        end
        # println()
        # println("It took $(coupon_count) coupon(s) for round ($round)")
        total += coupon_count
        # println()
    end
    println("total / rounds = ", total / rounds)

end


function expected_value(coupon_count) 

    return sum([coupon_count / (coupon_count - i) for i in 1:(coupon_count - 1)])

end