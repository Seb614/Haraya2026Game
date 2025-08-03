extends Area2D

@onready var text_label = %Label

var interactable = false
var visibility = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_body_entered(body):
	interactable = true
	
func _on_body_exited(body):
	interactable = false
	
func _process(delta):
	if Input.is_action_just_pressed("E"):
		if interactable:
			visibility = !visibility
			text_label.visible = visibility
