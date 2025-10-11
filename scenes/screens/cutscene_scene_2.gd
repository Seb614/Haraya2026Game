extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	

@onready var blur_material = $Control/ColorRect.material

@onready var blink_rect = $Blink

var blink_times = [2, 4.0, 6.5, 8.0]  # Start and end times of each blink


var time = 0.0
var duration = 10.0
var max_blur = 40.0

var time_elapsed = 0.0
var tilt_duration = 10.0
var tilt_speed = 2.5
var tilt_angle = 0.1  


func _process(delta):
	time += delta
	var t = clamp(time / duration, 0.0, 1.0)
	var blur_value = lerp(max_blur, 0.0, t)
	blur_material.set_shader_parameter("blur_scale", blur_value)
	
	if time_elapsed < tilt_duration:
		time_elapsed += delta
		$TempCave.rotation = sin(time_elapsed * tilt_speed) * tilt_angle
	else:
		$TempCave.rotation = 0.0
	
	for i in range(0, blink_times.size(), 2):
		if time >= blink_times[i] and time < blink_times[i + 1]:
			blink_rect.modulate.a = 1.0
			var tween = create_tween()
			tween.tween_property(blink_rect, "modulate:a", 1.0, 0.8)
			
			return
	var tween = create_tween()
	tween.tween_property(blink_rect, "modulate:a", 0.0, 0.5)
	
	if time >= 12:
		Fade.transition()
		await Fade.on_transition_finished
		Fade.get_tree().change_scene_to_file("res://scenes/screens/black2.tscn")
