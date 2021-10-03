extends Spatial

const CROP_DATA = preload("res://scenes/plot/crop_data.gd")

func _ready():
	Farm.plots = self

func add_crop(crop_type: int) -> bool:
	for child in get_children():
		var farm_plot := child as FarmPlot
		if farm_plot.crop_type == CROP_DATA.CROPS.NONE:
			farm_plot.crop_type = crop_type
			return true
	return false
