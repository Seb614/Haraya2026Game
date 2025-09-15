extends PathFollow3D

var speed = 0.2

func _ready():
	
	await get_tree().create_timer(7.5).timeout
	var tween = create_tween()
	tween.tween_property(self, "speed", 10, 0.6)
	tween.tween_property(self, "speed", 0.5, 0.1)
	
func _process(delta):
	progress += delta * speed 
	
		
