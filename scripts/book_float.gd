extends Sprite2D 

@export var amplitude: float = 10 
@export var speed: float = 2.0       

var base_y: float = 0.0
var time_passed: float = 0.0

func _ready():
	base_y = position.y

func _process(delta):
	time_passed += delta * speed
	position.y = base_y + sin(time_passed) * amplitude
