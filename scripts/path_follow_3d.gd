extends PathFollow3D

var speed = 0.3

	
func _process(delta):
	progress += delta * speed 
	speed += delta / 6 * 2
