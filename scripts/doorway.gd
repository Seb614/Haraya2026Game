extends Area2D

@export var target_scene: String

var interactable = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_body_entered(body):
	interactable = true
	
func _on_body_exited(body):
	interactable = false
	
func _process(delta):
	if Input.is_action_just_pressed("interact"):
		if interactable:
			get_tree().change_scene_to_file("res://scenes/screens/" + target_scene)
