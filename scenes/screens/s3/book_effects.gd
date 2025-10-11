extends Sprite2D

var original_scale = Vector2.ONE
var hover_scale = Vector2(1.5, 1.5)
var shaking = false
var tween: Tween

func _ready():
	original_scale = scale
	set_process(false)

func _process(delta):
	if shaking:
		position.x = randf_range(-1.5, 1.5)
		position.y = randf_range(-1.5, 1.5)



func _on_area_2d_mouse_entered() -> void:
	tween = create_tween()
	tween.tween_property(self, "scale", hover_scale, 0.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	set_process(true)
	shaking = true
	print("hmm")
	


func _on_area_2d_mouse_exited() -> void:
	tween = create_tween()
	tween.tween_property(self, "scale", original_scale, 0.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	set_process(false)
	shaking = false
	position = Vector2.ZERO  # Reset shake offset
	
