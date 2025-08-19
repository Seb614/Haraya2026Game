extends Node2D

@onready var spawn_1 : Node2D = $Spawn1
@onready var spawn_0 : Node2D = $Spawn0

var spawn_x 
var spawn_y

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(GlobalData.travel_dir)
	if GlobalData.travel_dir == 0:
		get_node("Player").position.x = spawn_1.position.x
		get_node("Player").position.y = spawn_1.position.y
	else:
		get_node("Player").position.x = spawn_0.position.x
		get_node("Player").position.y = spawn_0.position.y
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
