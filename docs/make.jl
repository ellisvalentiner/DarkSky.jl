using Documenter, DarkSky

makedocs()

deploydocs(
    deps   = Deps.pip("mkdocs"),
    repo   = "github.com/ellisvalentiner/DarkSky.jl.git",
    julia  = "0.6"
)
