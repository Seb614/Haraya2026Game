extends Node2D

#@onready var ring1=$Sinagtala
#@onready var ring2=$Kamaliing
#@onready var ring3 = $Agni
#@onready var ring4 = $Ragatan
@export var next : String

func _ready():
	pass
	#ring1.modulate.a = 0
	#ring2.modulate.a = 0
	#ring3.modulate.a = 0
	#ring4.modulate.a = 0
	#fade(ring1)
	#await get_tree().create_timer(0.67).timeout
	#fade(ring2)
	#await get_tree().create_timer(0.67).timeout
	#fade(ring3)
	#await get_tree().create_timer(0.67).timeout
	#fade(ring4)
	#await get_tree().create_timer(0.67).timeout
#
#func fade(ring: MeshInstance2D):
	#var tween = create_tween()
	#tween.tween_property(ring, "modulate", Color(1.0, 1.0, 1.0, 1), 0.67).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		print("click")
		NavManager.fade_to_scene("res://scenes/screens/s5/" + next + ".tscn")
