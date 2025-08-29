extends Node2D

#@onready var spawn_1 : Node2D = $Spawn1
#@onready var spawn_0 : Node2D = $Spawn0
#
#var spawn_x 
#var spawn_y

# Called when the node enters the scene tree for the first time.
func _ready():
	#print(GlobalData.travel_dir)
	#if GlobalData.travel_dir == 0:
		#get_node("Player").position.x = spawn_1.position.x
		#get_node("Player").position.y = spawn_1.position.y
	#else:
		#get_node("Player").position.x = spawn_0.position.x
		#get_node("Player").position.y = spawn_0.position.y
	if NavManager.spawn_door_tag != null:
		_on_level_spawn(NavManager.spawn_door_tag)
	Fade.ftn()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	

func _on_level_spawn(destination_tag: String):
	var door_path = "Doors/Door_" + destination_tag
	var door = get_node(door_path) as Door
	NavManager.trigger_player_spawn(door.spawn.global_position ,door.spawn_direction)
