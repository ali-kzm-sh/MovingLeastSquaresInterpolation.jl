using MovingLeastSquaresInterpolation
using Documenter

DocMeta.setdocmeta!(MovingLeastSquaresInterpolation, :DocTestSetup, :(using MovingLeastSquaresInterpolation); recursive=true)

makedocs(;
    modules=[MovingLeastSquaresInterpolation],
    authors="ali-kzm-sh <alikazemzadeh.sh@gmail.com> and contributors",
    sitename="MovingLeastSquaresInterpolation.jl",
    format=Documenter.HTML(;
        canonical="https://ali-kzm-sh.github.io/MovingLeastSquaresInterpolation.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/ali-kzm-sh/MovingLeastSquaresInterpolation.jl",
    devbranch="main",
)
