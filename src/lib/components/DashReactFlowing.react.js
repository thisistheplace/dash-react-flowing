import React, { useCallback, useEffect, useState } from 'react'
import PropTypes from 'prop-types'
import ReactFlow, {
  Controls,
  addEdge,
  useEdgesState,
  applyNodeChanges
} from 'react-flow-renderer'

const DashReactFlowing = (props) => {
  const {
    id,
    nodes,
    edges,
    defaultEdgeOptions,
    fitViewOptions,
    style,
    setProps
  } = props

  const [currentNodes, setNodes] = useState(nodes)
  const [currentEdges, setEdges, onEdgesChange] = useEdgesState(edges)

  useEffect(() => {
    setNodes(props.nodes)
  }, [props.nodes])

  const onNodesChange = useCallback(
    (changes) => {
      setNodes(
        (nds) => {
          const newnodes = applyNodeChanges(changes, nds)
          setProps({ nodes: newnodes })
          return newnodes
        }
      )
    },
    [setProps, setNodes]
  )

  const onConnect = useCallback(
    (connection) => {
      setEdges(
        (eds) => {
          const neweds = addEdge(connection, eds)
          setProps({ edges: neweds })
          return neweds
        }
      )
    },
    [setProps, setEdges]
  )

  return (
    <ReactFlow
      id={id}
      nodes={currentNodes}
      edges={currentEdges}
      onNodesChange={onNodesChange}
      onEdgesChange={onEdgesChange}
      onConnect={onConnect}
      fitViewOptions={fitViewOptions}
      defaultEdgeOptions={defaultEdgeOptions}
      style={style}
    >
      <Controls/>
    </ReactFlow>
  )
}

DashReactFlowing.defaultProps = {
  nodes: [],
  edges: [],
  defaultEdgeOptions: { animated: true },
  style: {}
}

DashReactFlowing.propTypes = {
  /**
   * The ID used to identify this component in Dash callbacks.
   */
  id: PropTypes.string.isRequired,

  /**
   * The nodes which make up the flow chart
   */
  nodes: PropTypes.arrayOf(
    PropTypes.shape({
      id: PropTypes.string,
      data: PropTypes.shape({
        label: PropTypes.string
      }),
      position: PropTypes.shape({
        x: PropTypes.number,
        y: PropTypes.number
      })
    })
  ),

  /**
   * The edges which connect the flow chart
   */
  edges: PropTypes.arrayOf(
    PropTypes.object
  ),

  /**
   * The default edge options
   */
  defaultEdgeOptions: PropTypes.object,

  /**
   * The fit view options
   */
  fitViewOptions: PropTypes.object,

  /**
   * The reactFlowStyle
   */
  style: PropTypes.object,

  /**
   * Dash-assigned callback that gets fired when the value changes.
   */
  setProps: PropTypes.func

}

export default DashReactFlowing
