using DarkSky
using Base.Test

response = forecast(42.3601, -71.0589);
@test typeof(response) === DarkSky.DarkSkyResponse
response = forecast(42.3601, -71.0589, DateTime(2018, 1, 1, 0, 0, 0));
@test typeof(response) === DarkSky.DarkSkyResponse
response = forecast(42.3601, -71.0589, DateTime(2018, 1, 1, 0, 0, 0), lang="es", units="si", exclude=["minutely"]);
@test typeof(response) === DarkSky.DarkSkyResponse
