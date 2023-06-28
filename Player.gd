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
var frameCount: int = 0
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
	frameCount += 1
	if going:
		turn()
		$CollisionShape2D.rotation = direction.angle()+visual_angle*(bias/angle_displacement)
		$Sprite2D.rotation = direction.angle()+visual_angle*(bias/angle_displacement)
		velocity = direction*speed
		if(frameCount%10 == 0):
			add_point_to_trailmanager()
		
		move_and_slide()
		for i in get_slide_collision_count():
			var collision = get_slide_collision(i)
			var rid = collision.get_collider_rid()
			var collisionLayer = PhysicsServer2D.body_get_collision_layer(rid)
			#print("I collided with ", collision.get_collider().name)
			if(collisionLayer % 2 == 1):
				#var cell = $Tilemap.world_to_map(collision.position - collision.normal)
				on_collide()
			print(collisionLayer)
			if(collisionLayer == 2):
				finish_collided.emit()
			

func add_point_to_trailmanager():

	trail_manager.add_point($Sprite2D/LeftWheelAnchor.global_position,$Sprite2D/RightWheelAnchor.global_position)

func turn():
	direction = direction.rotated(bias*angular_speed)

func switch_direction():
	bias *= -1
	switched_direction.emit()
func _input(event):
	if event.is_action_pressed("button"):
		switch_direction()



