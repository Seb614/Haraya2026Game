extends Node2D

var time = 0
var pulse = false
var breaks = false
var next = false

func _process(delta: float) -> void:
	time += delta
	
	if time >= 2 and !pulse:
		%Pulse.modulate.a = 1.0
		pulse = !pulse
		get_node("AnimationPlayer").play("piece2")
	if time >= 3 and !breaks:
		breaks = !breaks
		get_node("AnimationPlayer").play("piece1")
	if time >= 6 and !next:
		next = !next
		NavManager.fade_to_scene("res://scenes/screens/s6/s_6b).tscn")
	
	
