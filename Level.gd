extends Node
signal player_win
signal player_fail
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_collided():
	$Camera.add_trauma(0.12)
	emit_signal("player_fail")
	$Camera/UI/CountDown.reset_countdown()
	


func _on_player_switched_direction():
	$Camera.add_trauma(0.07)


func _on_player_finish_collided():
	emit_signal("player_win")


func _on_count_down_countdown_ended():
	$Player.start()
	$TrailManager.clear()
