extends Node2D

var target_position: Vector2 = Vector2.ZERO
var has_target: bool = false
var speed: float = 200.0

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		target_position = get_global_mouse_position()
		has_target = true

func _process(delta):
	if has_target:
		var direction = (target_position - position).normalized()
		position += direction * speed * delta

		if position.distance_to(target_position) < 5:
			has_target = false
