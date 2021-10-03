extends Spatial

onready var front_sprite: AnimatedSprite3D = $Front
onready var center_sprite: AnimatedSprite3D = $Center
onready var back_sprite: AnimatedSprite3D = $Back

onready var sprites: Array = [front_sprite, center_sprite, back_sprite]

var current_animation = "wheat"

func _ready():
	set_animation(current_animation)

func set_animation(animation: String):
	current_animation = animation
	for crop_sprite in sprites:
		var animated_sprite := crop_sprite as AnimatedSprite3D
		animated_sprite.animation = animation
		animated_sprite.frame = 0
		
	if current_animation == "pumpkin":
		front_sprite.visible = false
		back_sprite.visible = false
	else:
		front_sprite.visible = true
		back_sprite.visible = true

func set_frame(frame: int):
	for crop_sprite in sprites:
		var animated_sprite := crop_sprite as AnimatedSprite3D
		animated_sprite.frame = frame


func show_next_frame():
	for crop_sprite in sprites:
		var animated_sprite := crop_sprite as AnimatedSprite3D
		var frame: int = animated_sprite.frame
		frame += 1
		frame = frame % animated_sprite.frames.get_frame_count(current_animation)
		animated_sprite.frame = frame
