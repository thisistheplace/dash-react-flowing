# AUTO GENERATED FILE - DO NOT EDIT

export dashreactflowing

"""
    dashreactflowing(;kwargs...)

A DashReactFlowing component.

Keyword arguments:
- `id` (String; required): The ID used to identify this component in Dash callbacks.
- `defaultEdgeOptions` (Dict; optional): The default edge options
- `edges` (Array of Dicts; optional): The edges which connect the flow chart
- `fitViewOptions` (Dict; optional): The fit view options
- `nodes` (optional): The nodes which make up the flow chart. nodes has the following type: Array of lists containing elements 'id', 'data', 'position'.
Those elements have the following types:
  - `id` (String; optional)
  - `data` (optional): . data has the following type: lists containing elements 'label'.
Those elements have the following types:
  - `label` (String; optional)
  - `position` (optional): . position has the following type: lists containing elements 'x', 'y'.
Those elements have the following types:
  - `x` (Real; optional)
  - `y` (Real; optional)s
- `style` (Dict; optional): The reactFlowStyle
"""
function dashreactflowing(; kwargs...)
        available_props = Symbol[:id, :defaultEdgeOptions, :edges, :fitViewOptions, :nodes, :style]
        wild_props = Symbol[]
        return Component("dashreactflowing", "DashReactFlowing", "dash_react_flowing", available_props, wild_props; kwargs...)
end

