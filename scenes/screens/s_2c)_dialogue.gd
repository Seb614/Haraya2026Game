extends Node2D

@export var dialogue_resource: DialogueResource
@export var dialogue_resource2: DialogueResource
@export var dialogue_resource3: DialogueResource
@export var dialogue_start: String ="start"

var d2 = false
var d3 = false

func _ready():
	DialogueManager.show_dialogue_balloon(dialogue_resource, dialogue_start)
	
func _process(float) -> void:
	if get_node("Player").position.x >= get_node("DialogueTrigger1").position.x and not d2:
		d2 = not d2
		DialogueManager.show_dialogue_balloon(dialogue_resource2, dialogue_start)
	if get_node("Player").position.x >= get_node("DialogueTrigger2").position.x and not d3:
		d3 = not d3
		DialogueManager.show_dialogue_balloon(dialogue_resource3, dialogue_start)
		
	if Input.is_action_just_pressed("interact"):
		if abs(get_node("Player").position.x - get_node("Book").position.x) <= 90:
			Fade.transition()
			await Fade.on_transition_finished
			Fade.get_tree().change_scene_to_file("res://scenes/screens/s_2e).tscn")
