function Base.show(io::IO, ps::PointSet1D)
    println(io, "PointSet1D")
    println(io, " ├─ Number of points : $(length(ps.x))")
    println(io, " ├─ Element type     : $(eltype(ps.x))")

    if isempty(ps.x)
        println(io, " └─ Point set        : Empty")
    elseif length(ps.x) <= 5
        formatted_points = [@sprintf("%.6f", val) for val in ps.x]
        println(io, " └─ Point set        : [$(join(formatted_points, ", "))]")
    else
        formatted_points = [@sprintf("%.6f", val) for val in ps.x[1:5]]
        println(io, " └─ Point set        : [$(join(formatted_points, ", ")), ...]")
    end
end

function Base.show(io::IO, ps::PointSet2D)
    println(io, "PointSet2D")
    println(io, " ├─ Number of points : $(length(ps.x))")
    println(io, " ├─ Element type     : $(eltype(ps.x))")

    if isempty(ps.x)
        println(io, " └─ Point set        : Empty")
    elseif length(ps.x) <= 5
        formatted_points = [@sprintf("%.6f", val) for val in ps.x]
        println(io, " ├─ Point set x      : [$(join(formatted_points, ", "))]")
        formatted_points = [@sprintf("%.6f", val) for val in ps.y]
        println(io, " └─ Point set y      : [$(join(formatted_points, ", "))]")
    else
        formatted_points = [@sprintf("%.6f", val) for val in ps.x[1:5]]
        println(io, " ├─ Point set x      : [$(join(formatted_points, ", ")), ...]")
        formatted_points = [@sprintf("%.6f", val) for val in ps.y[1:5]]
        println(io, " └─ Point set y      : [$(join(formatted_points, ", ")), ...]")
    end
end

function Base.show(io::IO, ps::PointSet3D)
    println(io, "PointSet3D")
    println(io, " ├─ Number of points : $(length(ps.x))")
    println(io, " ├─ Element type     : $(eltype(ps.x))")

    if isempty(ps.x)
        println(io, " └─ Point set        : Empty")
    elseif length(ps.x) <= 5
        formatted_points = [@sprintf("%.6f", val) for val in ps.x]
        println(io, " ├─ Point set x      : [$(join(formatted_points, ", "))]")
        formatted_points = [@sprintf("%.6f", val) for val in ps.y]
        println(io, " ├─ Point set y      : [$(join(formatted_points, ", "))]")
        formatted_points = [@sprintf("%.6f", val) for val in ps.z]
        println(io, " └─ Point set z      : [$(join(formatted_points, ", "))]")
    else
        formatted_points = [@sprintf("%.6f", val) for val in ps.x[1:5]]
        println(io, " ├─ Point set x      : [$(join(formatted_points, ", ")), ...]")
        formatted_points = [@sprintf("%.6f", val) for val in ps.y[1:5]]
        println(io, " ├─ Point set y      : [$(join(formatted_points, ", ")), ...]")
        formatted_points = [@sprintf("%.6f", val) for val in ps.z[1:5]]
        println(io, " └─ Point set z      : [$(join(formatted_points, ", ")), ...]")
    end
end

