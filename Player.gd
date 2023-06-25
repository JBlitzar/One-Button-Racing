extends CharacterBody2D
class_name Player

@export var trail_manager: TrailManager
@export var angle_displacement: float = 20
var bias = 0
@export var speed: int = 300
@export var angular_speed: float = 0.003
var direction = Vector2(1,0)
@export var visual_angle: float = 0.1
var start_pos: Vector2
var start_rot: float
signal collided
signal finish_collided
signal switched_direction


var going = false
func start():
	going = true
func _ready():
	bias = angle_displacement
	start_pos = position
	start_rot = rotation
func on_collide():
	emit_signal("collided")
	position = start_pos
	rotation = start_rot
	going = false
func _physics_process(delta):
	if going:
		turn()
		$CollisionShape2D.rotation = direction.angle()+visual_angle*(bias/angle_displacement)
		$Sprite2D.rotation = direction.angle()+visual_angle*(bias/angle_displacement)
		velocity = direction*speed
		add_point_to_trailmanager()
		
		move_and_slide()
		for i in get_slide_collision_count():
			var collision = get_slide_collision(i)
			#print("I collided with ", collision.get_collider().name)
			if(collision.get_collider().name == "TileMap"):
				#var cell = $Tilemap.world_to_map(collision.position - collision.normal)
				on_collide()
			if(collision.get_collider().name == "Finish"):
				emit_signal("finish_collided")
			

func add_point_to_trailmanager():

	trail_manager.add_point($Sprite2D/LeftWheelAnchor.global_position,$Sprite2D/RightWheelAnchor.global_position)

func turn():
	direction = direction.rotated(bias*angular_speed)

func switch_direction():
	bias *= -1
	emit_signal("switched_direction")
func _input(event):
	if event.is_action_pressed("button"):
		switch_direction()



