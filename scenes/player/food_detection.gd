extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	set_collision_mask_value(Constants.food_layer, true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_just_pressed("eat")):
		for food in get_overlapping_bodies():
			food.emit_signal("attract_food", self)

func eat_nutriment(nutriment: FoodConfig.Nutriment):
	get_node("../").eat_nutriment(nutriment)
