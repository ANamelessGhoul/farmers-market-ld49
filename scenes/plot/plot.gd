extends Spatial

func _on_Area_input_event(_camera, event, _click_position, _click_normal, _shape_idx):
	if event is InputEventMouseButton:
		var mouse_button_event := event as InputEventMouseButton
		if mouse_button_event.is_pressed() and \
				mouse_button_event.button_index == BUTTON_LEFT:
			print(name + " clicked!")
