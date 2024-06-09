extends RigidBody2D

signal eat_food(inside: bool)
signal attract_food(body: Node2D)

var target: Node2D

var speed = Constants.player_speed * 1.3

var eaten = false

var in_eat_zone = false

# Called when the node enters the scene tree for the first time.
func _ready():
	set_collision_layer_value(Constants.food_layer, true)

func _physics_process(delta):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if target != null and !eaten and in_eat_zone:
		eat_target()
	if eaten:
		position = target.global_position
	elif target != null:
		var direction = target.global_position - global_position
		position += direction.normalized() * speed * delta

func eat_target():
	eaten = true
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", Color(1, 1, 1, 0), 1)
	await tween.finished
	queue_free()


func _on_eat_food(inside: bool):
	in_eat_zone = inside


func _on_attract_food(body: Node2D):
	target = body
