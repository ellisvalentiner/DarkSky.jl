VERSION >= v"0.6.0" && __precompile__()

module DarkSky

using HTTP
using JSON
using Base.Dates

function _get_json(url::String)
    response = HTTP.get(url)
    info(response)
    if response.status == 200
        return JSON.Parser.parse(String(response.body))
    end
end

forecast(latitude::Float64, longitude::Float64) = _get_json("https://api.darksky.net/forecast/$(ENV["DARKSKY_API_KEY"])/$latitude,$longitude")
forecast(latitude::Float64, longitude::Float64, time::DateTime) = _get_json("https://api.darksky.net/forecast/$(ENV["DARKSKY_API_KEY"])/$latitude,$longitude,$time")
export forecast

end # module
