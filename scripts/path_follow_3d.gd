extends PathFollow3D

var speed = 2

	
func _process(delta):
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		progress += delta * speed * direction
