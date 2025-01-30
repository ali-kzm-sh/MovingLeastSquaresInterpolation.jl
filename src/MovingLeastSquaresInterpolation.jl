module MovingLeastSquaresInterpolation
#=
╭────────────────────────────────────────────────────────────────────────────────────────╮
│                           Moving Least Squares Interpolation                           │
╞════════════════════════════════════════════════════════════════════════════════════════╡
│ utils.jl                                                                               │
│                                                                                        │
│ - This file contain utility functions and helper methods.                              │
│                                                                                        │
├────────────────────────────────────────────────────────────────────────────────────────┤
│                                                                                        │
╰────────────────────────────────────────────────────────────────────────────────────────╯
=#
using LinearAlgebra
using Printf

include("PointSets.jl")

include("WeightFunctions.jl")

include("PolynomialFunctions.jl")

include("utils.jl")

end
