extends Spatial
class_name InventoryCrop

const CROP_DATA = preload("res://scenes/plot/crop_data.gd")

var crop_type = CROP_DATA.CROPS.NONE setget _set_crop_type
var lifetime = 10 setget _set_lifetime

onready var crop_sprite: Sprite3D = $CropSprite
onready var decay_sprite: Sprite3D = $DecaySprite
onready var decay_progress: TextureProgress = $Viewport/TextureProgress

func _ready():
	_set_crop_type(CROP_DATA.CROPS.WHEAT)

func decay_tick():
	if crop_type != CROP_DATA.CROPS.NONE:
		decay_progress.value -= 1
		if decay_progress.value == 0:
			_set_crop_type(CROP_DATA.CROPS.NONE)
	

func _set_crop_type(type: int):
	crop_type = type
	
	if crop_type == CROP_DATA.CROPS.NONE:
		crop_sprite.visible = false
		decay_sprite.visible = false
	else:
		crop_sprite.visible = true
		decay_sprite.visible = true
		
		crop_sprite.texture = CROP_DATA.CROP_ICONS[crop_type]
		lifetime = CROP_DATA.CROP_DECAY[crop_type]
		decay_progress.value = lifetime
		decay_progress.max_value = lifetime

func _set_lifetime(crop_time: int):
	lifetime = crop_time
	decay_progress.value = lifetime
	decay_progress.max_value = lifetime
