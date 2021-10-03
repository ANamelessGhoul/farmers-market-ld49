extends Spatial

func _start_clicked():
	$SucessSound.play()
	get_tree().change_scene("res://scenes/world/world.tscn")

func _on_Area_input_event(_camera, event, _click_position, _click_normal, _shape_idx):
	if event is InputEventMouseButton:
		var mouse_button_event := event as InputEventMouseButton
		if mouse_button_event.is_pressed() and \
				mouse_button_event.button_index == BUTTON_LEFT:
			
			_start_clicked()
