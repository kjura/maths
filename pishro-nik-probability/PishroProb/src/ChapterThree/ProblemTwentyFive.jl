# Pishornik Chapter Three Exercise 25

"""
a.
"""

function pmf_a(k)
    if k == 1
        return 0.4
    elseif k == 2
        return 0.3
    elseif k == 3
        return 0.3
    else
        return 0
    end
end