extends Node


var basket: Spatial

func add_crop(crop: int) -> bool:
	return basket.add_crop(crop)

func remove_crop(crop: int) -> bool:
	return basket.remove_crop(crop)

func has_space() -> bool:
	return basket.has_space()
