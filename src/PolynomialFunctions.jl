export monomialBasis1D, monomialBasis2D, monomialBasis3D

"""
    monomialBasis1D(ξ::T; degree::Int64=1) where {T<:AbstractFloat}

Generates a 1D monomial basis up to the specified degree.

# Arguments:
- `ξ`: A scalar value where the basis is evaluated.
- `degree`: The maximum degree of the monomials (default: 1).

# Returns
A vector of monomials [1, ξ, ξ^2, ..., ξ^degree].
"""
function monomialBasis1D(ξ::T; degree::Int64=1) where {T<:AbstractFloat}
    @assert degree >= 0 "Degree must be non-negative"
    return [ξ^i for i in 0:degree]
end
"""
    monomialBasis2D(ξ::T, η::T; degree::Int64=1) where {T<:AbstractFloat}

Generates a 2D monomial basis up to the specified degree.

# Arguments:
- `ξ`: The first coordinate where the basis is evaluated.
- `η`: The second coordinate where the basis is evaluated.
- `degree`: The maximum combined degree of the monomials (default: 1).

# Returns:
A vector of monomials [1, ξ, η, ξ^2, ξη, η^2, ...]
"""
function monomialBasis2D(ξ::T, η::T; degree::Int64=1) where {T<:AbstractFloat}
    @assert degree >= 0 "Degree must be non-negative"
    return [ξ^i * η^j for i in 0:degree for j in 0:(degree-i)]
end

"""
    monomialBasis3D(ξ::T, η::T, ζ::T; degree::Int64=1) where {T<:AbstractFloat}

Generates a 3D monomial basis up to the specified degree.

# Arguments:
- `ξ`: The first coordinate where the basis is evaluated.
- `η`: The second coordinate where the basis is evaluated.
- `ζ`: The third coordinate where the basis is evaluated.
- `degree`: The maximum combined degree of the monomials (default: 1).

#Returns:
A vector of monomials [1, ξ, η, ζ, ξ^2, ξη, ξζ, η^2, ...].
"""
function monomialBasis3D(ξ::T, η::T, ζ::T; degree::Int64=1) where {T<:AbstractFloat}
    @assert degree >= 0 "Degree must be non-negative"
    return [ξ^i * η^j * ζ^k for i in 0:degree for j in 0:(degree-i) for k in 0:(degree-i-j)]
end

"""
    monomialBasis1D(ξ::T; degree::Int64=1) where {T<:Vector{<:AbstractFloat}}

Generates a 1D monomial basis evaluated over a vector of points.

# Arguments:
- `ξ`: A vector of values where the basis is evaluated.
- `degree`: The maximum degree of the monomials (default: 1).

# Returns:
A matrix where each column corresponds to a monomial evaluated at all points in ξ.
"""
function monomialBasis1D(ξ::T; degree::Int64=1) where {T<:Vector{<:AbstractFloat}}
    @assert degree >= 0 "Degree must be non-negative"
    return stack([ξ .^ i for i in 0:degree])
end

"""
    monomialBasis2D(ξ::T, η::T; degree::Int64=1) where {T<:Vector{<:AbstractFloat}}

Generates a 2D monomial basis evaluated over vectors of points.

# Arguments:
- `ξ`: A vector of first coordinates.
- `η`: A vector of second coordinates.
- `degree`: The maximum combined degree of the monomials (default: 1).

# Returns:
A matrix where each column corresponds to a monomial evaluated at all points in ξ and η.
"""
function monomialBasis2D(ξ::T, η::T; degree::Int64=1) where {T<:Vector{<:AbstractFloat}}
    @assert degree >= 0 "Degree must be non-negative"
    @assert length(ξ) == length(η) "Vectors ξ and η must have the same length, but got $(length(ξ)) and $(length(η))"
    return stack([ξ .^ i .* η .^ j for i in 0:degree for j in 0:(degree-i)])
end
"""
    monomialBasis3D(ξ::T, η::T, ζ::T; degree::Int64=1) where {T<:Vector{<:AbstractFloat}}

Generates a 3D monomial basis evaluated over vectors of points.

# Arguments:
- `ξ`: A vector of first coordinates.
- `η`: A vector of second coordinates.
- `ζ`: A vector of third coordinates.
- `degree`: The maximum combined degree of the monomials (default: 1).
Returns: A matrix where each column corresponds to a monomial evaluated at all points in ξ, η, and ζ.
"""
function monomialBasis3D(ξ::T, η::T, ζ::T; degree::Int64=1) where {T<:Vector{<:AbstractFloat}}
    @assert degree >= 0 "Degree must be non-negative"
    @assert length(ξ) == length(η) == length(ζ) "Vectors ξ, η and ζ must have the same length, but got $(length(ξ)), $(length(η)) and $(length(ζ))"
    return stack([ξ .^ i .* η .^ j .* ζ .^ k for i in 0:degree for j in 0:(degree-i) for k in 0:(degree-i-j)])
end
