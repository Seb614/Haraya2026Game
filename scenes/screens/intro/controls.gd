extends Node2D

var time_elapsed = 0.0
var event_interval_1 = 2.0
var event_interval_2 = 4
var event_interval_3 = 6
var event_interval_4 = 8
var event_interval_5 = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ControlIcons/Wasd.modulate.a = 0.0
	$ControlIcons/Interact.modulate.a = 0.0
	$ControlIcons/Jump.modulate.a = 0.0
	$ControlIcons/Sprint.modulate.a = 0.0
	
	$ControlText/wasd_label.modulate.a = 0.0
	$ControlText/e_label.modulate.a = 0.0
	$ControlText/space_label.modulate.a = 0.0
	$ControlText/shift_label.modulate.a = 0.0
	$ControlText/continue.modulate.a = 0.0
	
	$ControlText/wasd_label2.modulate.a = 0.0
	$ControlText/wasd_label3.modulate.a = 0.0
	$ControlText/e_label2.modulate.a = 0.0
	$ControlText/space_label2.modulate.a = 0.0
	$ControlText/shift_label2.modulate.a = 0.0

var fade_duration = 2 # seconds
var target_alpha = 1.0 # 0 for fully transparent, 1 for fully opaque

func fade_icon(sprite_name):
	var tween = create_tween()
	tween.tween_property(get_node("ControlIcons/" + sprite_name), "modulate:a", target_alpha, fade_duration)

func fade_text(text_name):
	var tween = create_tween()
	tween.tween_property(get_node("ControlText/" + text_name), "modulate:a", target_alpha, fade_duration)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	time_elapsed += delta
	
	if time_elapsed >= event_interval_1:
		fade_icon("Wasd")
		fade_text("wasd_label")
		fade_text("wasd_label2")
		fade_text("wasd_label3")
	if time_elapsed >= event_interval_2:
		fade_icon("Interact")
		fade_text("e_label")
		fade_text("e_label2")
	if time_elapsed >= event_interval_3:
		fade_icon("Sprint")
		fade_text("shift_label")
		fade_text("shift_label2")
	if time_elapsed >= event_interval_4:
		fade_icon("Jump")
		fade_text("space_label")
		fade_text("space_label2")
	if time_elapsed >= event_interval_5:
		fade_text("continue")

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		print("click")
		if time_elapsed >= event_interval_5:
			NavManager.fade_to_scene("res://scenes/screens/black.tscn")
