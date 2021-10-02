extends Spatial


const CROP_DATA = preload("res://scenes/plot/crop_data.gd")

const MAX_GROWTH: int = 3

export (CROP_DATA.CROPS) var crop_type: int = 0

var growth_stage: int = 0 setget _set_growth_stage
var growth_tick: int = 0
var current_crop_data: Dictionary = {}

onready var animator = $Animation

func _ready():
	var _e = GameLoop.connect("tick", self, "_on_GameLoop_tick")
	_set_crop_type(crop_type)

func harvest():
	Inventory.add_crop(crop_type)

func grow():
	if growth_stage == MAX_GROWTH:
		return
	growth_tick += 1
	if growth_tick >= current_crop_data.growth_ticks:
		growth_tick = 0
		growth_stage += 1
		animator.set_frame(growth_stage)


func _on_GameLoop_tick():
	if crop_type != CROP_DATA.CROPS.NONE:
		grow()

func _set_growth_stage(stage: int):
	growth_stage = stage
	animator.set_frame(growth_stage)

func _set_crop_type(type: int):
	crop_type = type
	
	if crop_type == CROP_DATA.CROPS.NONE:
		animator.visible = false
		current_crop_data = {}
	else:
		animator.visible = true
		current_crop_data = CROP_DATA.CROP_DICT[crop_type]
		animator.set_animation(current_crop_data.animation)
	
	_set_growth_stage(0)

func _clicked():
	if growth_stage == MAX_GROWTH:
		harvest()
		_set_crop_type(CROP_DATA.CROPS.NONE)

func _on_Area_input_event(_camera, event, _click_position, _click_normal, _shape_idx):
	if event is InputEventMouseButton:
		var mouse_button_event := event as InputEventMouseButton
		if mouse_button_event.is_pressed() and \
				mouse_button_event.button_index == BUTTON_LEFT:
			
			_clicked()
