using Random, Distributions
Random.seed!(44)

function geo(p)
    d = Geometric(p)
    P₁ = 1 - cdf(d, 5)
    P₂ = cdf(d, 6) - cdf(d, 2)
    P₃ = (cdf(d, 8) - pdf(d, 8) - cdf(d, 5)) / cdf(d, 8) - pdf(d, 8)

    println("Geometric distribution:")
    println("P(X > 5) = $P₁")
    println("P(2 < X <= 6) = $P₂")
    println("P(X > 5 | X < 8) = $P₃")
end

function bino(n, p)
    d = Binomial(n, p)
    P₁ = 1 - cdf(d, 5)
    P₂ = cdf(d, 6) - cdf(d, 2)
    P₃ = (cdf(d, 8) - pdf(d, 8) - cdf(d, 5)) / cdf(d, 8) - pdf(d, 8)

    println("Binomial distribution:")
    println("P(X > 5) = $P₁")
    println("P(2 < X <= 6) = $P₂")
    println("P(X > 5 | X < 8) = $P₃")
end

function pascal(r, p)
    d = NegativeBinomial(r, p)
    P₁ = 1 - cdf(d, 5)
    P₂ = cdf(d, 6) - cdf(d, 2)
    P₃ = (cdf(d, 8) - pdf(d, 8) - cdf(d, 5)) / cdf(d, 8) - pdf(d, 8)

    println("Pascal distribution:")
    println("P(X > 5) = $P₁")
    println("P(2 < X <= 6) = $P₂")
    println("P(X > 5 | X < 8) = $P₃")
end

function hypergeo(s, f, n)
    d = Hypergeometric(s, f, n)
    P₁ = 1 - cdf(d, 5)
    P₂ = cdf(d, 6) - cdf(d, 2)
    P₃ = (cdf(d, 8) - pdf(d, 8) - cdf(d, 5)) / cdf(d, 8) - pdf(d, 8)

    println("Hypergeometric distribution:")
    println("P(X > 5) = $P₁")
    println("P(2 < X <= 6) = $P₂")
    println("P(X > 5 | X < 8) = $P₃")
end

function poison(λ)
    d = Poisson(λ)
    P₁ = 1 - cdf(d, 5)
    P₂ = cdf(d, 6) - cdf(d, 2)
    P₃ = (cdf(d, 8) - pdf(d, 8) - cdf(d, 5)) / cdf(d, 8) - pdf(d, 8)

    println("Poisson distribution:")
    println("P(X > 5) = $P₁")
    println("P(2 < X <= 6) = $P₂")
    println("P(X > 5 | X < 8) = $P₃")
end