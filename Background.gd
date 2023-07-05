extends TileMap

@export var size: int

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(-size,size):
		for j in range(-size,size):
			set_cell(0,Vector2i(i,j),0,Vector2i(randi_range(0,1),randi_range(0,1)),randi_range(0,2))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
