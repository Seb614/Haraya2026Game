extends Node2D

@export var dialogue_resource: DialogueResource


var d2 = false
var d3 = false
var d4 = false
var d5 = false
func _ready():
	DialogueManager.show_dialogue_balloon(dialogue_resource, "mural1")
	
func _process(_float) -> void:
	if get_node("Player").position.x >= get_node("Trigger1").position.x and not d2:
		d2 = not d2
		DialogueManager.show_dialogue_balloon(dialogue_resource, "mural2")
	if get_node("Player").position.x >= get_node("Trigger2").position.x and not d3:
		d3 = not d3
		DialogueManager.show_dialogue_balloon(dialogue_resource, "mural3")
	if get_node("Player").position.x >= get_node("Trigger3").position.x and not d4:
		d4 = not d4
		DialogueManager.show_dialogue_balloon(dialogue_resource, "mural4")
	if get_node("Player").position.x >= get_node("Trigger4").position.x and not d5:
		d5 = not d5
		DialogueManager.show_dialogue_balloon(dialogue_resource, "mural5")
	#if Input.is_action_just_pressed("interact"):
		#if abs(get_node("Player").position.x - get_node("Book").position.x) <= 90:
			#Fade.transition()
			#await Fade.on_transition_finished
			#Fade.get_tree().change_scene_to_file("res://scenes/screens/s_2e).tscn")
