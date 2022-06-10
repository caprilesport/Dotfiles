# Use revise by default

try
    using Revise
catch e
    @warn "Error initializing Revise" exception=(e, catch_backtrace())
end

try
    using OhMyREPL
catch e
    @warn "Error initializing OhMyREPL" exception=(e, catch_backtrace())
end
