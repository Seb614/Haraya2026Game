extends Camera2D

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String ="start"

func _ready():
	DialogueManager.show_dialogue_balloon(dialogue_resource, dialogue_start)
