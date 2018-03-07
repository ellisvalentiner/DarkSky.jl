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

DarkSky.jl expects your API key to be stored as an environment variable, `DARKSKY_API_KEY`.

## Usage

```julia
using DarkSky
forecast(latitude=42.3601, longitude=-71.0589)
```
