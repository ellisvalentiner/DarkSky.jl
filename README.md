# DarkSky.jl

A Julia wrapper for the Dark Sky weather data API.

## Overview

This package is a wrapper for the Dark Sky API.

The Dark Sky API requires an API key. See the [Dark Sky Developer Documentation](https://darksky.net/dev/docs) to request one.

## Installation

```julia
# DarkSky.jl is not currently registered as an official package
# Please install the development version from GitHub:
Pkg.clone("git://github.com:ellisvalentiner/DarkSky.jl.git")
```

DarkSky.jl expects your API key to be stored as an environment variable named `DARKSKY_API_KEY`.

## Usage

```julia
using DarkSky
# Make a "Forecast Request", returns the current weather forecast for the next week.
forecast(42.3601, -71.0589)
# Make a "Time Machine Request", returns the observed or forecast weather conditions for a date in the past or future.
forecast(42.3601, -71.0589, DateTime(2018, 3, 7, 14, 19, 57))
```
