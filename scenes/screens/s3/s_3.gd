extends Node2D

@export var next: String

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		print("click")
		NavManager.fade_to_scene("res://scenes/screens/s3/" + next + ".tscn")
