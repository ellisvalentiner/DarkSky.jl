using DarkSky
using Base.Test

response = forecast(42.3601, -71.0589);
@test typeof(response) === DarkSky.DarkSkyResponse
response = forecast(42.3601, -71.0589, exclude=["currently"], extend="hourly");
@test typeof(response) === DarkSky.DarkSkyResponse
response = forecast(42.3601, -71.0589, DateTime(2018, 1, 1, 0, 0, 0));
@test typeof(response) === DarkSky.DarkSkyResponse
@test latitude(response) === 42.3601
@test longitude(response) === -71.0589
@test timezone(response) == "America/New_York"
@test typeof(currently(response)) === Dict{String, Any}
@test typeof(minutely(response)) === Dict{String, Any}
@test typeof(daily(response)) === Dict{String, Any}
@test typeof(alerts(response)) === Array{Any, 1}
@test typeof(flags(response)) === Dict{String, Any}
response = forecast(42.3601, -71.0589, DateTime(2018, 1, 1, 0, 0, 0), lang="es", units="si", exclude=["minutely"]);
@test typeof(response) === DarkSky.DarkSkyResponse
