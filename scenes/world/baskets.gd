extends Spatial

const CROP_DATA = preload("res://scenes/plot/crop_data.gd")

onready var inventory = $Inventory

func _ready():
	Inventory.basket = self
	Inventory.connect("crop_added", self, "_on_Inventory_crop_added")
	Inventory.connect("crop_sold", self, "_on_Inventory_crop_sold")
	GameLoop.connect("tick", self, "_on_GameLoop_tick")

func has_space() -> bool:
	return has_crop(CROP_DATA.CROPS.NONE)

func has_crop(crop_type: int) -> bool:
	for child in inventory.get_children():
		var crop := child as InventoryCrop
		if crop.crop_type == crop_type:
			return true
	return false

func add_crop(crop_type: int) -> void:
	for child in inventory.get_children():
		var crop := child as InventoryCrop
		if crop.crop_type == CROP_DATA.CROPS.NONE:
			crop.crop_type = crop_type
			return

func remove_crop(crop_type: int) -> void:
	var crop_with_least_time: InventoryCrop 
	for child in inventory.get_children():
		var crop := child as InventoryCrop
		if crop.crop_type == crop_type:
			if crop_with_least_time:
				if crop_with_least_time.lifetime > crop.lifetime:
					crop_with_least_time = crop
			else:
				crop_with_least_time = crop
	crop_with_least_time.crop_type = CROP_DATA.CROPS.NONE

func decay_crops():
	for child in inventory.get_children():
		var crop := child as InventoryCrop
		if crop.crop_type != CROP_DATA.CROPS.NONE:
			crop.decay_tick()

func _on_Inventory_crop_added(crop_type: int) -> void:
	add_crop(crop_type)

func _on_Inventory_crop_sold(crop_type: int):
	remove_crop(crop_type)

func _on_GameLoop_tick():
	decay_crops()
