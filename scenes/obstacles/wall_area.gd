extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	set_collision_layer_value(Constants.food_layer, true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
