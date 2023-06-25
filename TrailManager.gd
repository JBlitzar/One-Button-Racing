extends Node

class_name TrailManager

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func add_point(posLeft: Vector2, posRight: Vector2):
	
	$LeftTrail.add_point(posLeft)
	$RightTrail.add_point(posRight)
