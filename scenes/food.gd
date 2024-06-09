extends RigidBody2D

signal eat_food()
signal attract_food(body: Node2D)

var target: Node2D

var speed = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	collision_layer = Constants.food_layer


func _integrate_forces(state):
	if target != null:
		var direction = target.global_position - global_position
		linear_velocity = direction.normalized() * speed

func _physics_process(delta):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_eat_food():
	if target == null:
		return
	speed *= 2
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", Color(1, 1, 1, 0), 1)
	await tween.finished
	queue_free()


func _on_attract_food(body: Node2D):
	target = body
	can_sleep  = false
