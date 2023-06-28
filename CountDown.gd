extends Label

@export var maxCount = 3
var currentCount = 0
signal countdown_ended
# Called when the node enters the scene tree for the first time.
func _ready():
	reset_countdown()
func reset_countdown():
	$CountdownTimer.start()
	currentCount = maxCount
	text = str(currentCount)
	
	visible = true


func _on_countdown_timer_timeout():
	currentCount -= 1
	text = str(currentCount)
	if currentCount <= 0:
		visible = false
		$CountdownTimer.stop()
		emit_signal("countdown_ended")
