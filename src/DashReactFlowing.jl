
module DashReactFlowing
using Dash

const resources_path = realpath(joinpath( @__DIR__, "..", "deps"))
const version = "0.0.2"

include("jl/dashreactflowing.jl")

function __init__()
    DashBase.register_package(
        DashBase.ResourcePkg(
            "dash_react_flowing",
            resources_path,
            version = version,
            [
                DashBase.Resource(
    relative_package_path = "dash_react_flowing.min.js",
    external_url = "https://unpkg.com/dash_react_flowing@0.0.2/dash_react_flowing/dash_react_flowing.min.js",
    dynamic = nothing,
    async = nothing,
    type = :js
),
DashBase.Resource(
    relative_package_path = "dash_react_flowing.min.js.map",
    external_url = "https://unpkg.com/dash_react_flowing@0.0.2/dash_react_flowing/dash_react_flowing.min.js.map",
    dynamic = true,
    async = nothing,
    type = :js
)
            ]
        )

    )
end
end
