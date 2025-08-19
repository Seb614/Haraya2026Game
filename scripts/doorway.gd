extends Area2D

@export var target_scene: String
@export var travel_dir: int
@export var msg : String

var interactable = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_body_entered(body):
	if body.name == "Player":
		interactable = true
	
func _on_body_exited(body):
	if body.name == "Player":
		interactable = false
	
func _process(delta):
	if Input.is_action_just_pressed("interact"):
		if interactable:
			print("Entered ", travel_dir)
			print(msg)
			GlobalData.travel_dir = travel_dir
			get_tree().change_scene_to_file("res://scenes/screens/" + target_scene)
