extends Node

@export var scenes:Array[PackedScene]
var next_scene_index: int = 0
var instance
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func handle_player_fail():
	pass
func on_game_win():
	next_scene_index = 0
func handle_player_win():
	remove_child(instance)
	instantiate_next_scene()
func instantiate_next_scene():
	if(len(scenes) <= next_scene_index):
		$UI.show()
		on_game_win()
		return
	instance = scenes[next_scene_index].instantiate()
	add_child(instance)
	instance.player_fail.connect(handle_player_fail)
	instance.player_win.connect(handle_player_win)
	next_scene_index += 1

func _on_play_pressed():
	$UI.hide()
	instantiate_next_scene()
	
