extends Node2D

@onready var S = get_node("Btns/S")
@onready var N = get_node("Btns/N")
@onready var E = get_node("Btns/E")
@onready var W = get_node("Btns/W")
@onready var seq = [N, E, W]
@export var dialogue_resource: DialogueResource
@export var dialogue_start: String ="start"
@onready var speed = 0.6
@onready var lose = $lose
@onready var win = $win


func _ready():

	
	seq.shuffle()
	seq.append(seq.pick_random())
	seq.append(seq.pick_random())
	seq.append(seq.pick_random())
	seq.append(seq.pick_random())
	print(seq)
	
	
	for i in range(5):
		print(await SimonSaysRound(i+3))
	DialogueManager.show_dialogue_balloon(dialogue_resource, "win")
	win.play()
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://scenes/screens/" + "spawn" + ".tscn")
func SimonSaysRound(level : int) -> String:
	
	var notDone := true
	var notMoveOn := true
	var failed = false
	while notDone:
		failed = false
		for i in seq:
			i.toggle_mode = true
			i.mouse_filter = Control.MOUSE_FILTER_IGNORE
		 
		for i in range(level):
			await get_tree().create_timer(0.3).timeout
			seq[i].scale = Vector2(0.9,0.9)
			seq[i].button_pressed = true
			seq[i].get_child(0).play()
			await get_tree().create_timer(0.5).timeout
			seq[i].scale = Vector2(1.0, 1.0)
			seq[i].button_pressed = false
			
		for i in seq:
			i.toggle_mode = false
			i.mouse_filter = Control.MOUSE_FILTER_STOP
		
		for i in range(level):
			notMoveOn = true
			while notMoveOn:
				await get_tree().create_timer(0).timeout
				var pressed = await check_buttons()
				if pressed != null:
					print(pressed == seq[i])
					if pressed == seq[i]:
						notMoveOn = false
					else:
						print("failed")
						failed = true
						DialogueManager.show_dialogue_balloon(dialogue_resource, "fail")
						lose.play()
						await get_tree().create_timer(0.5).timeout
						
						
				if failed:
					break
			if failed:
				break
		if !failed:
			notDone = false
			break
	for i in seq:
		i.toggle_mode = true
		i.mouse_filter = Control.MOUSE_FILTER_IGNORE
		i.button_pressed = true
	await get_tree().create_timer(0.5).timeout
	for i in seq:
		i.button_pressed = false
		i.toggle_mode = false
		i.mouse_filter = Control.MOUSE_FILTER_STOP
	
	return "won"

func check_buttons() -> TextureButton:

	for btn in $Btns.get_children():
		if btn.is_hovered():
			btn.scale = Vector2(1.05,1.05)
		else:
			btn.scale = Vector2(1,1)
		if btn.button_pressed:
			btn.button_pressed = false
			btn.scale = Vector2(0.9,0.9)
			btn.get_child(0).play()
			await get_tree().create_timer(0.3).timeout
			btn.scale = Vector2(1,1)	
			return btn
	return null
	

		
	
	

	
