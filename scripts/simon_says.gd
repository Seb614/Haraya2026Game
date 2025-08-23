extends Node2D

@onready var S = $S
@onready var N = $N
@onready var E = $E
@onready var W = $W
@onready var seq = ["S", "N", "E", "W"]
func _ready():
	seq.shuffle()
	seq.append(seq.pick_random())
	SimonSaysRound(5)

func SimonSaysRound(level : int) -> bool:
	print(level)
	var notDone := true
	while notDone:
		for i in get_node("Btns").get_children():
			i.mouse_filter = Control.MOUSE_FILTER_IGNORE
		 
		for i in range(level):
			await get_tree().create_timer(1.0).timeout
			get_node("Btns/" + seq[i]).button_pressed = true
			await get_tree().create_timer(0.5).timeout
			get_node("Btns/" + seq[i]).button_pressed = false
			print(seq[i])
		for i in get_node("Btns").get_children():
			i.mouse_filter = Control.MOUSE_FILTER_STOP
	return true

func _on_button_pressed(_index: int) -> void:
	return
