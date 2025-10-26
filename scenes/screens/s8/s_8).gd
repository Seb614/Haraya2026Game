extends Node2D

@export var dialogue_resource: DialogueResource
@onready var glitch = $Glitch
@onready var mat = $Glitch.material as ShaderMaterial
@onready var player = $Player
@onready var nuno = $Nuno 
@onready var end = $end
@onready var fadeGlitch = preload("res://scenes/screens/s8/glitch_transition.gdshader")
func _ready():
	DialogueManager.show_dialogue_balloon(dialogue_resource, "start")


func _glitchOn():
	var tween = create_tween()
	tween.tween_property(glitch, "modulate", Color(1.0, 1.0, 1.0, 1), 3).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	
func _glitchOut():
	var tween = create_tween()
	tween.tween_property(glitch, "modulate", Color(1.0, 1.0, 1.0, 0), 3).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
func _glitchFade():
	glitch.modulate.a = 1.0
	var tween = create_tween()
	tween.tween_property(mat, "shader_parameter/fade", 1.0, 2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(nuno, "modulate", Color(1.0, 1.0, 1.0, 0), 0.67).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(player, "modulate", Color(1.0, 1.0, 1.0, 0), 0.67).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(end, "modulate", Color(1.0, 1.0, 1.0, 1.0), 2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
