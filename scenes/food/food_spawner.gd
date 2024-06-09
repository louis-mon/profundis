extends CollisionShape2D

@export var food_scene: PackedScene

@export var spawn_time = 10

@export var max_spawns = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$SpawnTimer.wait_time = spawn_time


func _on_spawn_timer_timeout():
	var angle = randf() * PI * 2
	var radius = shape.radius * sqrt(randf())
	var food = food_scene.instantiate() as Food
	food.position = position + Vector2.from_angle(angle).normalized() * radius
	food.expiration = spawn_time * max_spawns
	get_parent().add_child(food)
