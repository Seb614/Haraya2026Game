extends Area2D


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
				Fade.transition()
				await Fade.on_transition_finished
				Fade.get_tree().change_scene_to_file("res://scenes/screens/s5/s_5b).tscn")
