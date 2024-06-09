extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	set_collision_mask_value(Constants.food_layer, true)


func _on_body_entered(body):
	body.emit_signal("eat_food")
