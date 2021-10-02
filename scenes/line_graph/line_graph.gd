extends Spatial

onready var buy_graph: Line2D = $Viewport/Node2D/BuyGraph
onready var sell_graph: Line2D = $Viewport/Node2D/SellGraph

const MAX_POINTS = 60

const GRAPH_WIDTH = 600
const GRAPH_SIGNED_HEIGHT = 150

# Expects value between -1, 1
func add_normalized_value_to_graph(value: float, graph: Line2D):
	var points = graph.points
	if points.size() >= MAX_POINTS:
		points.remove(0)
	
	for i in points.size():
		points[i].x -= 10
	
	var scaled_value = GRAPH_SIGNED_HEIGHT * value
	points.append(Vector2(GRAPH_WIDTH, scaled_value))
	graph.points = points

func add_normalized_buy_value(value: float):
	add_normalized_value_to_graph(value, buy_graph)

func add_normalized_sell_value(value: float):
	add_normalized_value_to_graph(value, sell_graph)
