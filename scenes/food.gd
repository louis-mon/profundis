extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	collision_layer = 1 | Constants.food_layer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
