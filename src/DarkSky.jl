VERSION >= v"0.6.0" && __precompile__()

module DarkSky

using HTTP
using JSON
using Base.Dates

Optional{T} = Union{T, Void}

struct DarkSkyResponse
    latitude::Float64
    longitude::Float64
    timezone::String
    currently::Optional{Dict}
    minutely::Optional{Dict}
    hourly::Optional{Dict}
    daily::Optional{Dict}
    alerts::Optional{Dict}
    flags::Optional{Dict}
end
DarkSkyResponse(x::Dict) = DarkSkyResponse((get.(x, String.(fieldnames(DarkSkyResponse)), nothing))...)

function _get_json(url::String, verbose::Bool)
    response = HTTP.get(url)
    verbose ? info(response) : nothing
    if response.status == 200
        return DarkSkyResponse(JSON.Parser.parse(String(response.body)))
    end
end

"""
    forecast(latitude::Float64, longitude::Float64; verbose::Bool=true)

Make a "Forecast Request", returns the current weather forecast for the next week.
"""
forecast(latitude::Float64, longitude::Float64; verbose::Bool=true) = _get_json("https://api.darksky.net/forecast/$(ENV["DARKSKY_API_KEY"])/$latitude,$longitude", verbose)
forecast(latitude::Float64, longitude::Float64, time::DateTime; verbose::Bool=true) = _get_json("https://api.darksky.net/forecast/$(ENV["DARKSKY_API_KEY"])/$latitude,$longitude,$time", verbose)
export forecast

end # module
