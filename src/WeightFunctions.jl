export linearWeight, gaussianWeight, cubicSplineWeight, quarticWeight, exponentialWeight, powerWeight, inverseDistanceWeight, polynomialWeight

"""
    linearWeight(ξ::T; d::T=T(1.0)) where {T<:AbstractFloat}

Computes a linear weight function with compact support. The weight decreases linearly with the distance `ξ` and is zero for `ξ >= d`.

# Arguments
- `ξ`: Distance from the evaluation point.
- `d`: Support radius (default: `1.0`).

# Returns
A weight value between `0.0` and `1.0`.
"""
function linearWeight(ξ::T; d::T=T(1.0)) where {T<:AbstractFloat}
    @assert d > 0 "Support radius d must be positive"
    q = ξ / d
    return q < 1 ? 1 - q : 0.0
end

"""
    gaussianWeight(ξ::T; d::T=T(1.0)) where {T<:AbstractFloat}

Computes a Gaussian weight function. The weight decays exponentially with the squared distance `ξ`.

# Arguments
- `ξ`: Distance from the evaluation point.
- `d`: Smoothing parameter (default: `1.0`).

# Returns
A positive weight value based on the Gaussian distribution.
"""
function gaussianWeight(ξ::T; d::T=T(1.0)) where {T<:AbstractFloat}
    @assert d > 0 "Smoothing parameter d must be positive"
    return exp(-(ξ / d)^2)
end

"""
    cubicSplineWeight(ξ::T; d::T=T(1.0)) where {T<:AbstractFloat}

Computes a cubic spline weight function with compact support. The function smoothly transitions to zero at `ξ = 2d`.

# Arguments
- `ξ`: Distance from the evaluation point.
- `d`: Support radius (default: `1.0`).

# Returns
A weight value between `0.0` and `2/3`.
"""
function cubicSplineWeight(ξ::T; d::T=T(1.0)) where {T<:AbstractFloat}
    @assert d > 0 "Support radius d must be positive"
    q = ξ / d
    if q < 1
        return (2 / 3) - q^2 + (1 / 2) * q^3
    elseif q < 2
        return (1 / 6) * (2 - q)^3
    else
        return 0.0
    end
end

"""
    quarticWeight(ξ::T; d::T=T(1.0)) where {T<:AbstractFloat}

Computes a quartic (Wendland) weight function with compact support. The weight is highly smooth and transitions to zero at `ξ = d`.

# Arguments
- `ξ`: Distance from the evaluation point.
- `d`: Support radius (default: `1.0`).

# Returns
A weight value between `0.0` and `1.0`.
"""
function quarticWeight(ξ::T; d::T=T(1.0)) where {T<:AbstractFloat}
    @assert d > 0 "Support radius d must be positive"
    q = ξ / d
    if q < 1
        return (1 - q)^4 * (1 + 4 * q)
    else
        return 0.0
    end
end

"""
    exponentialWeight(ξ::T; d::T=T(1.0)) where {T<:AbstractFloat}

Computes an exponential weight function. The weight decays exponentially with the distance `ξ`.

# Arguments
- `ξ`: Distance from the evaluation point.
- `d`: Decay parameter (default: `1.0`).

# Returns
A positive weight value based on exponential decay.
"""
function exponentialWeight(ξ::T; d::T=T(1.0)) where {T<:AbstractFloat}
    @assert d > 0 "Decay parameter d must be positive"
    return exp(-ξ / d)
end

"""
    powerWeight(ξ::T; d::T=T(1.0), p::Int64=2) where {T<:AbstractFloat}

Computes a power weight function with compact support. The weight is proportional to `(1 - ξ/d)^p` for `ξ < d` and zero otherwise.

# Arguments
- `ξ`: Distance from the evaluation point.
- `d`: Scaling parameter (default: `1.0`).
- `p`: Power exponent (default: `2`).

# Returns
A weight value between `0.0` and `1.0`.
"""
function powerWeight(ξ::T; d::T=T(1.0), p::Int64=2) where {T<:AbstractFloat}
    @assert d > 0 "Scaling parameter d must be positive"
    @assert p > 0 "Power parameter p must be positive"
    q = ξ / d
    return q < 1 ? (1 - q)^p : 0.0
end

"""
    inverseDistanceWeight(ξ::T; epsilon::T=T(1e-6)) where {T<:AbstractFloat}

Computes an inverse distance weight function. The weight is inversely proportional to the distance `ξ`, with a small epsilon to prevent division by zero.

# Arguments
- `ξ`: Distance from the evaluation point.
- `epsilon`: Small positive value to avoid singularity (default: `1e-6`).

# Returns
A positive weight value inversely proportional to `ξ`.
"""
function inverseDistanceWeight(ξ::T; epsilon::T=T(1e-6)) where {T<:AbstractFloat}
    return 1 / (ξ + epsilon)
end

"""
    polynomialWeight(ξ::T; d::T=T(1.0), degree::Int64=2) where {T<:AbstractFloat}

Computes a polynomial weight function with compact support. The weight is proportional to `(1 - ξ/d)^degree` for `ξ < d` and zero otherwise.

# Arguments
- `ξ`: Distance from the evaluation point.
- `d`: Support radius (default: `1.0`).
- `degree`: Degree of the polynomial (default: `2`).

# Returns
A weight value between `0.0` and `1.0`.
"""
function polynomialWeight(ξ::T; d::T=T(1.0), degree::Int64=2) where {T<:AbstractFloat}
    @assert d > 0 "Support radius d must be positive"
    @assert degree >= 0 "Degree must be non-negative"
    q = ξ / d
    return q < 1 ? (1 - q)^degree : 0.0
end
