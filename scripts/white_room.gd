extends Node3D


var time_elapsed = 0.0
var event_interval = 8 # Trigger event every 5 seconds

func _process(delta):
	time_elapsed += delta
	
	if time_elapsed >= event_interval:
		get_tree().change_scene_to_file("res://scenes/screens/spawn.tscn")
