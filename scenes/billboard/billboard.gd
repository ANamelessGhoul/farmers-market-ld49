tool
extends Spatial


export var label_text = "Example Text" setget _set_label_text, _get_label_text

onready var label = $Viewport/Label

func _ready():
	_set_label_text(label_text)

func _set_label_text(text: String) -> void:
	label_text = text
	if label:
		label.text = text

func _get_label_text() -> String:
	if label:
		return label_text
	return ""

