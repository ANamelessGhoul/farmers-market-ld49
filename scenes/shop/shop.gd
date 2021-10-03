extends Spatial

const CROP_DATA = preload("res://scenes/plot/crop_data.gd")
const BUY_TEMPLATE = "BUY %s$"
const SELL_TEMPLATE = "SELL %s$"

export (CROP_DATA.CROPS) var crop_type: int = 0
export var buy_starting: int = 100
export var sell_starting: int = 100

var buy_amount: int = 100 setget _set_buy_amount
var sell_amount: int = 100 setget _set_sell_amount

onready var buy_button = $BuyButton
onready var sell_button = $SellButton
onready var value_graph = $LineGraph

func _ready():
	self.buy_amount = buy_starting
	self.sell_amount = sell_starting
	
	var _e = Market.connect("crop_values_changed", self, "_on_Market_crop_values_changed")


func _buy_clicked():
	var success: bool = Farm.add_crop(crop_type)
	if success:
		Money.money -= Market.crop_values[crop_type].buy

func _sell_clicked():
	var success: bool = Inventory.remove_crop(crop_type)
	if success:
		Money.money += Market.crop_values[crop_type].sell

func _set_buy_amount(buy: int):
	buy_amount = buy
	buy_button.label_text = BUY_TEMPLATE % buy_amount

func _set_sell_amount(sell: int):
	sell_amount = sell
	sell_button.label_text = SELL_TEMPLATE % sell_amount

func _update_graph(crop_values: Dictionary):
	var default_value = CROP_DATA.CROP_VALUES[crop_type]
	var normalized_buy_value = (crop_values[crop_type].buy - default_value) / float(default_value)
	var normalized_sell_value = (crop_values[crop_type].sell - default_value) / float(default_value)
	value_graph.add_normalized_buy_value(normalized_buy_value)
	value_graph.add_normalized_sell_value(normalized_sell_value)

func _on_Market_crop_values_changed(crop_values: Dictionary):
	_update_graph(crop_values)
	self.buy_amount = crop_values[crop_type].buy
	self.sell_amount = crop_values[crop_type].sell

func _on_BuyArea_input_event(_camera, event, _click_position, _click_normal, _shape_idx):
	if event is InputEventMouseButton:
		var mouse_button_event := event as InputEventMouseButton
		if mouse_button_event.is_pressed() and \
				mouse_button_event.button_index == BUTTON_LEFT:
			
			_buy_clicked()


func _on_SellArea_input_event(_camera, event, _click_position, _click_normal, _shape_idx):
	if event is InputEventMouseButton:
		var mouse_button_event := event as InputEventMouseButton
		if mouse_button_event.is_pressed() and \
				mouse_button_event.button_index == BUTTON_LEFT:
			
			_sell_clicked()
