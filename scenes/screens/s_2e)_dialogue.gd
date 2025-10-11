extends Node2D

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String ="start"

var time_passed = 0.0

func _ready():
	DialogueManager.show_dialogue_balloon(dialogue_resource, dialogue_start) 

func _process(delta) -> void:
	time_passed += delta

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if time_passed >= 10:
			print("click")
			NavManager.fade_to_scene("res://scenes/screens/s3/s_3a).tscn")
