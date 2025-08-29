extends CanvasLayer

@onready var color_rect = $ColorRect
@onready var animation_player = $AnimationPlayer

signal on_transition_finished

func _ready():
	color_rect.visible = false
	animation_player.animation_finished.connect(_on_animation_finished)
	
func transition():
	color_rect.visible = true
	animation_player.play("ftb")


func ftn():
	animation_player.play("ftn")
	
func _on_animation_finished(anim_name):
	if anim_name == "ftb":
		print("ftb done")
		on_transition_finished.emit()
		animation_player.play("ftn")
	elif anim_name == "ftn":
		color_rect.visible = false	
