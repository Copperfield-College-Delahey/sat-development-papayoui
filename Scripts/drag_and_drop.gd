extends Sprite2D

signal dropped(position: Vector2) 

var is_dragging := false #set the initial status as not dragging

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT: #setting the input to LMB
			if event.pressed:
				if get_click_bounds().has_point(to_local(event.position)): #ChatGPT consulted for command
					is_dragging = true
			else:
				if is_dragging:
					is_dragging = false
					emit_signal("dropped", global_position)

func _process(delta):
	if is_dragging:
		global_position = get_global_mouse_position()

func get_click_bounds() -> Rect2: #ChatGPT consulted for function implementation
	if texture:
		var size = texture.get_size()
		return Rect2(-size / 2, size)
	return Rect2()
