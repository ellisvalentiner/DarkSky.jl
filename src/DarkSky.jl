VERSION >= v"0.6.0" && __precompile__()

module DarkSky

using Requests
using Base.Dates

function _get_json(url::String)
    response = Requests.get(url)
    if Requests.statuscode(response) == 200
        return Requests.json(response)
    end
end

forecast(latitude::Float64, longitude::Float64) = _get_json("https://api.darksky.net/forecast/$(ENV["DARKSKY_API_KEY"])/$latitude,$longitude")
forecast(latitude::Float64, longitude::Float64, time::DateTime) = _get_json("https://api.darksky.net/forecast/$(ENV["DARKSKY_API_KEY"])/$latitude,$longitude,$time")
export forecast

end # module
