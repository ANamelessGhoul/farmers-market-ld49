
enum CROPS{
	NONE = -1,
	WHEAT,
	BEET,
	PUMPKIN,
	GRAPE,
}

const CROP_DICT: Dictionary = {
	CROPS.WHEAT: {"animation": "wheat", "growth_ticks": 2},
	CROPS.BEET: {"animation": "beet", "growth_ticks": 4},
	CROPS.PUMPKIN: {"animation": "pumpkin", "growth_ticks": 6},
	CROPS.GRAPE: {"animation": "grape", "growth_ticks": 4},
}

const CROP_VALUES: Dictionary = {
	CROPS.WHEAT: 50,
	CROPS.BEET: 100,
	CROPS.PUMPKIN: 200,
	CROPS.GRAPE: 100,
}

const CROP_MUTATION_STEP: Dictionary = {
	CROPS.WHEAT: 5,
	CROPS.BEET: 10,
	CROPS.PUMPKIN: 20,
	CROPS.GRAPE: 10,
}

const CROP_DECAY: Dictionary = {
	CROPS.WHEAT: 30,
	CROPS.BEET: 20,
	CROPS.PUMPKIN: 30,
	CROPS.GRAPE: 15,
}

const CROP_ICONS: Dictionary = {
	CROPS.WHEAT: preload("res://sprites/crops/wheat/WheatIcon.png"),
	CROPS.BEET: preload("res://sprites/crops/beet/beet_icon.png"),
	CROPS.PUMPKIN: preload("res://sprites/crops/pumpkin/pumpkin_icon.png"),
	CROPS.GRAPE: preload("res://sprites/crops/grape/grape_icon.png"),
}
