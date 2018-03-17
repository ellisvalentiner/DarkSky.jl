VERSION >= v"0.6.0" && __precompile__()

module DarkSky

using HTTP
using JSON
using Base.Dates

OptionalDict = Union{Dict, Void}

struct DarkSkyResponse
    latitude::Float64
    longitude::Float64
    timezone::String
    currently::OptionalDict
    minutely::OptionalDict
    hourly::OptionalDict
    daily::OptionalDict
    alerts::OptionalDict
    flags::OptionalDict
end
DarkSkyResponse(x::Dict) = DarkSkyResponse((get.(x, String.(fieldnames(DarkSkyResponse)), nothing))...)

function _get_json(url::String, verbose::Bool)
    response = HTTP.get(url)
    verbose ? info(response) : nothing
    if response.status == 200
        return DarkSkyResponse(JSON.Parser.parse(String(response.body)))
    end
end

forecast(latitude::Float64, longitude::Float64; verbose::Bool=true) = _get_json("https://api.darksky.net/forecast/$(ENV["DARKSKY_API_KEY"])/$latitude,$longitude", verbose)
forecast(latitude::Float64, longitude::Float64, time::DateTime; verbose::Bool=true) = _get_json("https://api.darksky.net/forecast/$(ENV["DARKSKY_API_KEY"])/$latitude,$longitude,$time", verbose)
export forecast

end # module
