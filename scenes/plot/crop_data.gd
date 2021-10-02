
enum CROPS{
	NONE = -1,
	WHEAT,
	BEET,
	PUMPKIN,
	GRAPE,
}

const CROP_DICT: Dictionary = {
	CROPS.WHEAT: {"animation": "wheat", "growth_ticks": 4},
	CROPS.BEET: {"animation": "beet", "growth_ticks": 8},
	CROPS.PUMPKIN: {"animation": "pumpkin", "growth_ticks": 12},
	CROPS.GRAPE: {"animation": "grape", "growth_ticks": 8},
}

const CROP_VALUES: Dictionary = {
	CROPS.WHEAT: 50,
	CROPS.BEET: 100,
	CROPS.PUMPKIN: 200,
	CROPS.GRAPE: 100,
}

const CROP_DECAY: Dictionary = {
	CROPS.WHEAT: 60,
	CROPS.BEET: 40,
	CROPS.PUMPKIN: 60,
	CROPS.GRAPE: 20,
}
