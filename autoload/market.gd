extends Node

signal crop_values_changed

const CROP_DATA = preload("res://scenes/plot/crop_data.gd")
const APPROACH_MEAN_CHANCE = 30
const NEGATIVE_MUTATION_CHANCE = 20
const POSITIVE_MUTATION_CHANCE = 20


var crop_values: Dictionary = {
	CROP_DATA.CROPS.WHEAT: {
		"buy": CROP_DATA.CROP_VALUES[CROP_DATA.CROPS.WHEAT],
		"sell": CROP_DATA.CROP_VALUES[CROP_DATA.CROPS.WHEAT]
	},
		CROP_DATA.CROPS.BEET: {
		"buy": CROP_DATA.CROP_VALUES[CROP_DATA.CROPS.BEET],
		"sell": CROP_DATA.CROP_VALUES[CROP_DATA.CROPS.BEET]
	},
		CROP_DATA.CROPS.PUMPKIN: {
		"buy": CROP_DATA.CROP_VALUES[CROP_DATA.CROPS.PUMPKIN],
		"sell": CROP_DATA.CROP_VALUES[CROP_DATA.CROPS.PUMPKIN]
	},
		CROP_DATA.CROPS.GRAPE: {
		"buy": CROP_DATA.CROP_VALUES[CROP_DATA.CROPS.GRAPE],
		"sell": CROP_DATA.CROP_VALUES[CROP_DATA.CROPS.GRAPE]
	},
}

func _ready():
	var _e = GameLoop.connect("tick", self, "_on_GameLoop_tick")
	call_deferred("emit_signal", "crop_values_changed", crop_values)


func mutate_crop_values():
	for crop_type in crop_values:
		var mutation_step = CROP_DATA.CROP_MUTATION_STEP[crop_type]
		
		# Buy mutation
		var random_factor = randi() % 100
		
		if random_factor < APPROACH_MEAN_CHANCE:
			if crop_values[crop_type].buy != CROP_DATA.CROP_VALUES[crop_type]:
				# Buy value approaches default
				if crop_values[crop_type].buy > CROP_DATA.CROP_VALUES[crop_type]:
					crop_values[crop_type].buy -= mutation_step
				else:
					crop_values[crop_type].buy += mutation_step
		
		elif randi() % 100 < NEGATIVE_MUTATION_CHANCE + APPROACH_MEAN_CHANCE:
			crop_values[crop_type].buy += mutation_step
		else:
			crop_values[crop_type].buy -= mutation_step
		
		# Sell mutation
		random_factor = randi() % 100
		
		if random_factor < APPROACH_MEAN_CHANCE:
			if crop_values[crop_type].sell != CROP_DATA.CROP_VALUES[crop_type]:
				# Buy value approaches default
				if crop_values[crop_type].sell > CROP_DATA.CROP_VALUES[crop_type]:
					crop_values[crop_type].sell -= mutation_step
				else:
					crop_values[crop_type].sell += mutation_step
		
		elif random_factor < NEGATIVE_MUTATION_CHANCE + APPROACH_MEAN_CHANCE:
			crop_values[crop_type].sell -= mutation_step
		elif random_factor < NEGATIVE_MUTATION_CHANCE + APPROACH_MEAN_CHANCE + POSITIVE_MUTATION_CHANCE:
			crop_values[crop_type].sell += mutation_step
			
	emit_signal("crop_values_changed", crop_values)

func _on_GameLoop_tick():
	mutate_crop_values()
