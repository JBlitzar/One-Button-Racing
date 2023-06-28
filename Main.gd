extends Node

@export var scenes:Array[PackedScene]
var next_scene_index: int = 0
var instance

func handle_player_fail():
	pass
	
func on_game_win():
	next_scene_index = 0
	
func handle_player_win():
	remove_child(instance)
	if(len(scenes) <= next_scene_index):
		reset_ui()
	else:
		instantiate_next_scene()

func reset_ui():
	$UI.show()
	on_game_win()

func instantiate_next_scene():
	
	instance = scenes[next_scene_index].instantiate()
	add_child(instance)
	instance.player_fail.connect(handle_player_fail)
	instance.player_win.connect(handle_player_win)
	next_scene_index += 1

func _on_play_pressed():
	$UI.hide()
	instantiate_next_scene()
	
