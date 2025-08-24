extends Area2D

@onready var text_label = %Label
@export var dialogue_resource: DialogueResource
@export var dialogue_start: String ="start"

var interactable = false
var visibility = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_body_entered(_body):
	interactable = true
	
func _on_body_exited(_body):
	interactable = false
	
func _process(_delta):
	if Input.is_action_just_pressed("interact"):
		if interactable:
			DialogueManager.show_dialogue_balloon(dialogue_resource, dialogue_start)
