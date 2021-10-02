extends Node

signal crop_added
signal crop_sold

var basket: Spatial

func add_crop(crop: int):
	emit_signal("crop_added", crop)

func sell_crop(crop: int):
	emit_signal("crop_sold", crop)

func has_space() -> bool:
	return basket.has_space()
