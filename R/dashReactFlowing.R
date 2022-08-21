# AUTO GENERATED FILE - DO NOT EDIT

#' @export
dashReactFlowing <- function(id=NULL, defaultEdgeOptions=NULL, edges=NULL, fitViewOptions=NULL, nodes=NULL, style=NULL) {
    
    props <- list(id=id, defaultEdgeOptions=defaultEdgeOptions, edges=edges, fitViewOptions=fitViewOptions, nodes=nodes, style=style)
    if (length(props) > 0) {
        props <- props[!vapply(props, is.null, logical(1))]
    }
    component <- list(
        props = props,
        type = 'DashReactFlowing',
        namespace = 'dash_react_flowing',
        propNames = c('id', 'defaultEdgeOptions', 'edges', 'fitViewOptions', 'nodes', 'style'),
        package = 'dashReactFlowing'
        )

    structure(component, class = c('dash_component', 'list'))
}
