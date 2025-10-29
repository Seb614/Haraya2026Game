extends Node2D

@export var dialogue_resource: DialogueResource
@onready var glitch = $Glitch
@onready var mat = $Glitch.material as ShaderMaterial
@onready var player = $Player
@onready var nuno = $Nuno 
@onready var end = $end
@onready var sound = $static
@onready var sfx = $static2
@onready var fadeGlitch = preload("res://scenes/screens/s8/glitch_transition.gdshader")
func _ready():
	DialogueManager.show_dialogue_balloon(dialogue_resource, "start")
	sound.play()

func _glitchOn(power, size, vol):
	var tween = create_tween()
	tween.tween_property(glitch, "modulate", Color(1.0, 1.0, 1.0, 1), 3).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	mat.set_shader_parameter("shake_power", power)
	mat.set_shader_parameter("shake_block_size", size)
	tween.tween_property(sound, "volume_db", vol, 1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)


func _glitchOut():
	var tween = create_tween()
	tween.tween_property(glitch, "modulate", Color(1.0, 1.0, 1.0, 0), 3).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(sound, "volume_db", -50, 0.8).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
func _glitchFade():
	glitch.modulate.a = 1.0
	var tween = create_tween()
	sfx.play()
	tween.tween_property(mat, "shader_parameter/fade", 1.0, 2.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	#tween.tween_property(nuno, "modulate", Color(1.0, 1.0, 1.0, 0), 0.67).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	#tween.tween_property(player, "modulate", Color(1.0, 1.0, 1.0, 0), 0.67).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(end, "modulate", Color(1.0, 1.0, 1.0, 1.0), 2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
