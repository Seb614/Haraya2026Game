extends Node2D

@export var dialogue_resource: DialogueResource
@onready var glitch = $Glitch
@onready var mat = $Glitch.material as ShaderMaterial
@onready var player = $Player
@onready var nuno = $NUNO 
@onready var end = $end
@onready var sound = $static
@onready var sfx = $static2
@onready var fadeGlitch = preload("res://scenes/screens/s8/glitch_transition.gdshader")
@onready var SECRET_CODE := "jerardlabrador"
@onready var input_buffer := ""
func _ready():
	
	%footsteps.play()
	get_node("NUNO/AnimatedSprite2D").play("walking")
	get_node("AnimationPlayer").play("new_animation")
	await get_node("AnimationPlayer").animation_finished
	get_node("NUNO/AnimatedSprite2D").play("idle")
	%footsteps.stop()
	await get_tree().create_timer(1.0).timeout
	DialogueManager.show_dialogue_balloon(dialogue_resource, "start")
	sound.play()

func _glitchOn(power, size, vol, vol2):
	var tween = create_tween()
	tween.tween_property(glitch, "modulate", Color(1.0, 1.0, 1.0, 1), 3).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	mat.set_shader_parameter("shake_power", power)
	mat.set_shader_parameter("shake_block_size", size)
	tween.tween_property(sound, "volume_db", vol, 1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(%bgsfx, "volume_db", vol2, 1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)


func _glitchOut():
	var tween = create_tween()
	tween.tween_property(glitch, "modulate", Color(1.0, 1.0, 1.0, 0), 1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(sound, "volume_db", -50, 0.8).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)

func _glitchFade():
	glitch.modulate.a = 1.0
	var tween = create_tween()
	tween.tween_property($static, "volume_db", -50, 1.5)
	sfx.play()
	tween.tween_property(mat, "shader_parameter/fade", 1.0, 2.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(%Usagi, "modulate", Color(1.0, 1.0, 1.0, 0), 0.67).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	#tween.tween_property(player, "modulate", Color(1.0, 1.0, 1.0, 0), 0.67).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(end, "modulate", Color(1.0, 1.0, 1.0, 1.0), 2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	await tween.finished
	tween.stop()
	tween.tween_property(%static2, "volume_db", -50, 5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)

	await get_tree().create_timer(10.0).timeout
	if true:
		NavManager.fade_to_scene("res://scenes/screens/s8/credits.tscn")

func _input(event):
	if event is InputEventKey and event.pressed and not event.echo:
		var charent = char(event.unicode).to_lower()

		# Accept only A–Z
		if charent.is_valid_identifier(): 
			input_buffer += charent
			print(input_buffer)
			# Keep buffer from growing too large
			if input_buffer.length() > SECRET_CODE.length():
				input_buffer = input_buffer.right(SECRET_CODE.length())
				
			# Check if it matches
			if input_buffer == SECRET_CODE:
				%Usagi.visible = true
				input_buffer = "" # reset to avoid repeat spam
