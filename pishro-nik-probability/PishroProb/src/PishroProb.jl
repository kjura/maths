# julia --project=.
module PishroProb

using Plots

include("ChapterThree/ProblemTwelve.jl")

export plot_cdf, plot_pmf, cdf, pmf

end # module PishroProb
