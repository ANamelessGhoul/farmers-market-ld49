extends Node

signal tick

var game_timer: Timer

func _ready():
	game_timer = Timer.new()
	game_timer.wait_time = 1.0
	game_timer.autostart = true
	var _e = game_timer.connect("timeout", self, "game_tick")
	add_child(game_timer)

func game_tick():
	emit_signal("tick")

func pause():
	game_timer.paused = true

func resume():
	game_timer.paused = false
