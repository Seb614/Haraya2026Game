extends Node2D

@onready var S = get_node("Btns/S")
@onready var N = get_node("Btns/N")
@onready var E = get_node("Btns/E")
@onready var W = get_node("Btns/W")
@onready var seq = [S, N, E, W]
@export var dialogue_resource: DialogueResource
@export var dialogue_start: String ="start"
@onready var speed = 0.6
func _ready():
	
	seq.shuffle()
	seq.append(seq.pick_random())
	print(seq)
	
	for i in range(6):
		print(await SimonSaysRound(i))
		speed -= 0.1
	DialogueManager.show_dialogue_balloon(dialogue_resource, "win")

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
			await get_tree().create_timer(speed).timeout
			seq[i].button_pressed = true
			await get_tree().create_timer(speed).timeout
			seq[i].button_pressed = false
			
		for i in seq:
			i.toggle_mode = false
			i.mouse_filter = Control.MOUSE_FILTER_STOP
		
		for i in range(level):
			notMoveOn = true
			seq[i]
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
						await get_tree().create_timer(0.5).timeout
						DialogueManager
						
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
		if btn.button_pressed:
			btn.button_pressed = false
			await get_tree().create_timer(0.1).timeout
			return btn
	return null
