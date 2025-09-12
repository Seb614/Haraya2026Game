extends Node

const scene_spawn = preload("res://scenes/screens/spawn.tscn")
const scene_spawn2 = preload("res://scenes/screens/spawn2.tscn")

var spawn_door_tag
signal on_trigger_player_spawn

func go_to_level(level_tag, destination_tag):
	
	var scene_to_load
	
	match(level_tag):
		"spawn1":
			scene_to_load = scene_spawn
		"spawn2":
			scene_to_load = scene_spawn2
	
	if scene_to_load != null:
		Fade.transition()
		await Fade.on_transition_finished
		spawn_door_tag = destination_tag
		get_tree().change_scene_to_packed(scene_to_load)
		
		
func trigger_player_spawn(position: Vector2, direction: String):
	on_trigger_player_spawn.emit(position, direction)

func fade_to_scene(scene_to_load : String):
	Fade.transition()
	await Fade.on_transition_finished
	get_tree().change_scene_to_file(scene_to_load)
