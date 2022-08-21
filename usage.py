import uuid

import dash_react_flowing
from dash import Dash, html, Input, Output, State, dcc, no_update

app = Dash(__name__)

initialNodes = [
  { "id": '1', "data": { "label": 'Node 1' }, "position": { "x": 5, "y": 5 } },
  { "id": '2', "data": { "label": 'Node 2' }, "position": { "x": 5, "y": 100 } },
]

initialEdges = [
  { "id": 'e1-2', "source": '1', "target": '2'},
]

initialData = {
  "nodes": initialNodes,
  "edges": initialEdges,
}

fitViewOptions = {
  "padding": 0.0
}

def new_node(num):
  return { "id": str(uuid.uuid4()), "data": { "label": f'Node {num}' }, "position": { "x": 5, "y": 5 } }

app.layout = html.Div(
    [
      dcc.Store(id='data-store', storage_type='session', data=initialData),
      html.Button("Add node", id='add-node', n_clicks=0),
      dcc.ConfirmDialog(
          id='new-data',
      ),
      dash_react_flowing.DashReactFlowing(
          id='flow-chart',
          nodes=initialNodes,
          edges=initialEdges,
          fitViewOptions=fitViewOptions
      ),
    ],
    style={"width":"100vw", "height": "100vh"}
)

@app.callback(
  Output('data-store', 'data'),
  Output('new-data', 'displayed'),
  Output('new-data', 'message'),
  Input('flow-chart', 'nodes'),
  Input('flow-chart', 'edges'),
  State('data-store', 'data'),
  prevent_initial_callback=True
)
def nodes_updated(nodes, edges, data):
  new_nodes = len(nodes) - len(data["nodes"])
  new_edges = len(edges) - len(data["edges"])
  data["nodes"] = nodes
  data["edges"] = edges
  if new_edges > 0 or new_nodes > 0:
    return data, True, f"Added: {new_edges} edges, {new_nodes} nodes"
  else:
    # Keep positions up to date
    return data, no_update, no_update

@app.callback(
  Output('flow-chart', 'nodes'),
  Input('add-node', 'n_clicks'),
  State('data-store', 'data'),
  prevent_initial_callback=True
)
def add_node(n, data):
  if n > 0:
    return data["nodes"] + [new_node(len(data["nodes"]) + 1)]
  else:
    return no_update

if __name__ == '__main__':
    app.run_server(debug=True)
