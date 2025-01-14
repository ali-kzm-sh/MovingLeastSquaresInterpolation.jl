export AbstractPointSet
export PointSet1D, PointSet2D, PointSet3D, PointSet

"""
    AbstractPointSet

Abstract type representing a generic set of points in space. 
Serves as the base type for all point set implementations.
"""
abstract type AbstractPointSet end

"""
    PointSet1D{T}(x::Vector{<:AbstractFloat})

Represents a 1D point set with coordinates `x` of type `T`.

# Fields
- `x::Vector{T}`: A vector of coordinates in 1D space.

# Constructor
- `PointSet1D(x::Vector{<:AbstractFloat})`: Creates a 1D point set, ensuring all elements in `x` have the same type.
"""
mutable struct PointSet1D{T} <: AbstractPointSet
    x::Vector{T}

    function PointSet1D(x::Vector{<:AbstractFloat})
        return new{eltype(x)}(x)
    end
end

"""
    PointSet2D{T}(x::Vector{<:AbstractFloat}, y::Vector{<:AbstractFloat})

Represents a 2D point set with coordinates `x` and `y` of type `T`.

# Fields
- `x::Vector{T}`: A vector of x-coordinates in 2D space.
- `y::Vector{T}`: A vector of y-coordinates in 2D space.

# Constructor
- `PointSet2D(x::Vector{<:AbstractFloat}, y::Vector{<:AbstractFloat})`: Creates a 2D point set, ensuring:
  - `x` and `y` have the same length.
  - `x` and `y` have the same element type.
"""
mutable struct PointSet2D{T} <: AbstractPointSet
    x::Vector{T}
    y::Vector{T}

    function PointSet2D(x::Vector{<:AbstractFloat}, y::Vector{<:AbstractFloat})
        @assert length(x) == length(y) "x and y must have the same length, got $(length(x)) and $(length(y))"
        @assert eltype(x) == eltype(y) "x and y must have the same element type, got $(typeof(x)) and $(typeof(y))"

        return new{eltype(x)}(x, y)
    end
end

"""
    PointSet3D{T}(x::Vector{<:AbstractFloat}, y::Vector{<:AbstractFloat}, z::Vector{<:AbstractFloat})

Represents a 3D point set with coordinates `x`, `y`, and `z` of type `T`.

# Fields
- `x::Vector{T}`: A vector of x-coordinates in 3D space.
- `y::Vector{T}`: A vector of y-coordinates in 3D space.
- `z::Vector{T}`: A vector of z-coordinates in 3D space.

# Constructor
- `PointSet3D(x::Vector{<:AbstractFloat}, y::Vector{<:AbstractFloat}, z::Vector{<:AbstractFloat})`: Creates a 3D point set, ensuring:
  - `x`, `y`, and `z` have the same length.
  - `x`, `y`, and `z` have the same element type.
"""
mutable struct PointSet3D{T} <: AbstractPointSet
    x::Vector{T}
    y::Vector{T}
    z::Vector{T}

    function PointSet3D(x::Vector{<:AbstractFloat}, y::Vector{<:AbstractFloat}, z::Vector{<:AbstractFloat})
        @assert length(x) == length(y) == length(z) "x, y and z must have the same length, got $(length(x)), $(length(y)) and $(length(z))"
        @assert eltype(x) == eltype(y) == eltype(z) "x, y and z must have the same element type, got $(typeof(x)), $(typeof(y)) and $(typeof(z))"

        return new{eltype(x)}(x, y, z)
    end
end

"""
    PointSet{T}

A flexible constructor interface for creating 1D, 2D, or 3D point sets.

# Methods
- `PointSet(x::T) where {T<:Vector{<:AbstractFloat}}`: Constructs a `PointSet1D`.
- `PointSet(x::T, y::T) where {T<:Vector{<:AbstractFloat}}`: Constructs a `PointSet2D`.
- `PointSet(x::T, y::T, z::T) where {T<:Vector{<:AbstractFloat}}`: Constructs a `PointSet3D`.

# Example
```julia
julia> x = [1.0, 2.0, 3.0];
julia> y = [4.0, 5.0, 6.0];
julia> z = [7.0, 8.0, 9.0];
julia> 
julia> ps1 = PointSet(x)       # Creates PointSet1D
PointSet1D
 ├─ Number of points : 3
 ├─ Element type     : Float64
 └─ Point set        : [1.000000, 2.000000, 3.000000]

julia> ps2 = PointSet(x, y)    # Creates PointSet2D
PointSet2D
 ├─ Number of points : 3
 ├─ Element type     : Float64
 ├─ Point set x      : [1.000000, 2.000000, 3.000000]
 └─ Point set y      : [4.000000, 5.000000, 6.000000]

julia> ps3 = PointSet(x, y, z) # Creates PointSet3D
PointSet3D
 ├─ Number of points : 3
 ├─ Element type     : Float64
 ├─ Point set x      : [1.000000, 2.000000, 3.000000]
 ├─ Point set y      : [4.000000, 5.000000, 6.000000]
 └─ Point set z      : [7.000000, 8.000000, 9.000000]
```
"""
mutable struct PointSet <: AbstractPointSet
    PointSet(x::T) where {T<:Vector{<:AbstractFloat}} = PointSet1D(x)
    PointSet(x::T, y::T) where {T<:Vector{<:AbstractFloat}} = PointSet2D(x, y)
    PointSet(x::T, y::T, z::T) where {T<:Vector{<:AbstractFloat}} = PointSet3D(x, y, z)
end

