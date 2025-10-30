extends Node2D

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		print("click")
		NavManager.fade_to_scene("res://scenes/screens/s6/s_6a).tscn")
