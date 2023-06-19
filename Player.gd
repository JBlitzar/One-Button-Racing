extends CharacterBody2D
@export var angle_displacement: float = 20
var bias = 0
@export var speed: int = 300
@export var angular_speed: float = 0.003
var direction = Vector2(1,0)
func _ready():
	bias = angle_displacement
func _physics_process(delta):
	turn()
	$CollisionShape2D.rotation = direction.angle()#+(bias/angle_displacement)
	$Sprite2D.rotation = direction.angle()#+(bias/angle_displacement)
	velocity = direction*speed
	$trail.add_point(position)
	move_and_slide()

func turn():
	direction = direction.rotated(bias*angular_speed)

func switch_direction():
	bias *= -1
func _input(event):
	if event.is_action_pressed("button"):
		switch_direction()



