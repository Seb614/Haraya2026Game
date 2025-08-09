extends Area2D


var interactable = false
var visibility = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_body_entered(body):
	interactable = true
	visibility = true
	
func _on_body_exited(body):
	interactable = false
	visibility = false
	
