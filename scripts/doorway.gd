extends Area2D

class_name Door

@export var target_scene: String
@export var spawn_direction: String
@export var msg : String
@export var target_door: String
@onready var spawn = $Spawn

var interactable = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_body_entered(body):
	if body.name == "Player":
		interactable = true
	
func _on_body_exited(body):
	if body.name == "Player":
		interactable = false

	
func _process(_delta):
	if Input.is_action_just_pressed("interact"):
		if interactable:
			if target_door != "": 
				NavManager.go_to_level(target_scene, target_door)
			else:
		
				get_tree().change_scene_to_file("res://scenes/screens/" + target_scene + ".tscn")
