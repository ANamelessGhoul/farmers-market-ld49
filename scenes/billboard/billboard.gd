tool
extends Spatial


export var label_text = "Example Text" setget _set_label_text, _get_label_text

onready var label = $Viewport/Label

func _set_label_text(text: String) -> void:
	label.text = text

func _get_label_text() -> String:
	return label.text

