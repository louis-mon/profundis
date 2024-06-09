extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	collision_mask = Constants.food_layer


func _on_body_entered(body):
	body.emit_signal("eat_food")
