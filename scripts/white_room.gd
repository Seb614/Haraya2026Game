extends Node3D

@onready var s1 = $MeshInstance3D5/Sprite3D1
@onready var s2 = $MeshInstance3D5/Sprite3D1/Sprite3D2
@onready var s3 = $MeshInstance3D5/Sprite3D1/Sprite3D2/Sprite3D3
@onready var s4 = $MeshInstance3D5/Sprite3D1/Sprite3D2/Sprite3D3/Sprite3D4

var time_elapsed = 0.0
var event_interval = 8 # Trigger event every 5 seconds

var material = StandardMaterial3D.new()
var agni = load("res://assets/sprites/agni.png")
var kama = load ("res://assets/sprites/kamaliing.png")
var sinag = load ("res://assets/sprites/sinagtala.png")
var raga = load ("res://assets/sprites/ragatan.png")

func _ready():
	pass
	#material.albedo_texture = agni
	#s1.material_override = material
	
	


func _process(delta):
	time_elapsed += delta
	
	if time_elapsed >= event_interval:
		get_tree().change_scene_to_file("res://scenes/screens/spawn.tscn")
