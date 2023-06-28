extends Node

class_name TrailManager
@export var randomAmt = 2
@export var maxHistory = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func add_point(posLeft: Vector2, posRight: Vector2):
	var offsetVec = Vector2(randf_range(-randomAmt,randomAmt),randf_range(-randomAmt,randomAmt))
	$LeftTrail.add_point(posLeft+offsetVec)
	$RightTrail.add_point(posRight+offsetVec)
func clear():
	var oldLeft = $LeftTrail.duplicate()
	var oldRight = $RightTrail.duplicate()
	$OldTrails.add_child(oldLeft)
	$OldTrails.add_child(oldRight)
	if(get_child_count()>maxHistory):
		remove_child(get_children()[0])
	$LeftTrail.clear_points()
	$RightTrail.clear_points()
	
