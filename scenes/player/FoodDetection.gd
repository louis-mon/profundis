extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	collision_mask = Constants.food_layer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_just_pressed("eat")):
		for food in get_overlapping_bodies():
			food.emit_signal("attract_food", self)
