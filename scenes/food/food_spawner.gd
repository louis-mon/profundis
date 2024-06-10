@tool
extends CollisionShape2D

var food_scene := preload("res://scenes/food/food.tscn")

@export var spawn_time = 10

@export var max_spawns = 3

@export var nutriment: FoodConfig.Nutriment

func _get_configuration_warnings():
	if !food_scene:
		return ["provide spawnable scene"]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$SpawnTimer.wait_time = spawn_time


func _on_spawn_timer_timeout():
	var angle := randf() * PI * 2
	var radius := (shape as CircleShape2D).radius * sqrt(randf())
	var food := food_scene.instantiate() as Food
	food.position = position + Vector2.from_angle(angle).normalized() * radius
	food.nutriment = nutriment
	food.expiration = spawn_time * max_spawns
	get_parent().add_child(food)
