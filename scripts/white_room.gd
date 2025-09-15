extends Node3D

@onready var s1 = $MeshInstance3D5/Sprite3D1
@onready var s2 = $MeshInstance3D5/Sprite3D1/Sprite3D2
@onready var s3 = $MeshInstance3D5/Sprite3D1/Sprite3D2/Sprite3D3
@onready var s4 = $MeshInstance3D5/Sprite3D1/Sprite3D2/Sprite3D3/Sprite3D4



var time_elapsed = 0.0
var event_interval = 20 # Trigger event every 5 seconds

var material = StandardMaterial3D.new()
var agni = load("res://assets/sprites/agni.png")
var kama = load ("res://assets/sprites/kamaliing.png")
var sinag = load ("res://assets/sprites/sinagtala.png")
var raga = load ("res://assets/sprites/ragatan.png")

func _ready():
	%Label3D.modulate.a = 0
	#material.albedo_texture = agni
	#s1.material_override = material
	
	


func _process(delta):
	time_elapsed += delta
	if time_elapsed >= event_interval:
		fade_text()
	
	#if time_elapsed >= event_interval:
	#	Fade.transition()
	#	await Fade.on_transition_finished
	#	Fade.get_tree().change_scene_to_file("res://scenes/screens/intro/controls.tscn")

func fade_text():
	var tween = create_tween()
	tween.tween_property(%Sprite3D, "modulate:a", 1, 2)
	tween.tween_property(%Label3D, "modulate:a", 1, 5)
	
func _input(event):
	if time_elapsed >= event_interval:
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			Fade.transition()
			await Fade.on_transition_finished
			Fade.get_tree().change_scene_to_file("res://scenes/screens/intro/controls.tscn")
