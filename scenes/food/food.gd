extends RigidBody2D

class_name Food

# after this duration (in seconds), the food will disappear, unless 0
@export var expiration: int

@export var nutriment: FoodConfig.Nutriment

signal eat_food(inside: bool)
signal attract_food(body: Node2D)

var target: Node2D

var speed = Constants.player_speed * 1.3

var eaten = false

var in_eat_zone = false

var expired = false

# Called when the node enters the scene tree for the first time.
func _ready():
	print(nutriment)
	($Nutriment as Sprite2D).texture = FoodConfig.icon_textures[nutriment]
	set_collision_layer_value(Constants.food_layer, true)
	if expiration > 0:
		$ExpirationTimer.start(expiration)

func _physics_process(delta):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if target != null and !eaten and in_eat_zone:
		eaten = true
		kill()
	if eaten:
		position = target.global_position
	elif target != null:
		var direction = target.global_position - global_position
		position += direction.normalized() * speed * delta

func kill():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", Color(1, 1, 1, 0), 1)
	await tween.finished
	queue_free()


func _on_eat_food(inside: bool):
	in_eat_zone = inside


func _on_attract_food(body: Node2D):
	if (expired):
		return
	target = body


func _on_expiration_timer_timeout():
	if target != null:
		return
	expired = true
	kill()
