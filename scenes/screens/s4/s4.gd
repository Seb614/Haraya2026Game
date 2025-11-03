extends Node2D


@export var dialogue_resource : DialogueResource
@export var next : String
@onready var seq = [%Ragatan, %Agni, %Sinagtala, %Kamaliing,  %Agni, %Kamaliing, %Sinagtala, %Ragatan]
func _ready():
	for button in seq:
		button.mouse_filter = Control.MOUSE_FILTER_IGNORE
		button.burn()
	await get_tree().create_timer(3).timeout
	await simonsaysround(4)
	await simonsaysround(5)
	await simonsaysround(6)
	await simonsaysround(7)
	await simonsaysround(8)
	DialogueManager.show_dialogue_balloon(dialogue_resource, "win")
	for i in [%Agni, %Kamaliing, %Sinagtala, %Ragatan, %parchment]:
		backburner(i)
		await get_tree().create_timer(0.5).timeout
	_fade()
func simonsaysround(level : int) -> bool:
	var notDone := true
	var notMoveOn := true
	var failed := false
	while notDone:
		failed = false
		for button in seq:
			button.mouse_filter = Control.MOUSE_FILTER_IGNORE
		for i in range(level):
			seq[i].glow()
			seq[i].sfx()
			await get_tree().create_timer(0.7).timeout
		for button in seq:
			button.mouse_filter = Control.MOUSE_FILTER_STOP
			button.toggle_mode = true
		for i in range(level):
			notMoveOn = true
			while notMoveOn:
				await get_tree().process_frame
				var pressed = await check_buttons()
				if pressed != null:
					print(pressed == seq[i])
					if pressed == seq[i]:
						pressed.glow()
						pressed.sfx()
						notMoveOn = false
					else:
						print("failed")
						pressed.failed()
						failed = true
						%sfx.volume_db = 0
						%sfx.play()
						var tween = create_tween()
						await get_tree().create_timer(1).timeout
						tween.tween_property(%sfx, "volume_db", -50, 1)
						DialogueManager.show_dialogue_balloon(dialogue_resource, "fail")
						await get_tree().create_timer(1).timeout
				if failed:
					break
			if failed:
				
				break
		if !failed:
			notDone = false
			for button in seq:
				button.mouse_filter = Control.MOUSE_FILTER_IGNORE
			break
		
	await get_tree().create_timer(1).timeout		
	return true
	
	
func check_buttons():
	for button in seq:
		if button.button_pressed:
			print(button)
			button.button_pressed = false
			return button
	
	return null

func _fade():
	NavManager.fade_to_scene("res://scenes/screens/s5/" + next + ".tscn")

func backburner(ikaw):
	var tween = create_tween()
	tween.tween_property(ikaw.material as ShaderMaterial, "shader_parameter/burn_progress", 0.0, 1)
