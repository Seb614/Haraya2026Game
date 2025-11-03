extends Node



var spawn_door_tag
signal on_trigger_player_spawn

func go_to_level(level_tag, destination_tag):
	
	var scene_to_load
	
	
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
