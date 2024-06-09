extends CharacterBody2D


func set_velocity_from_input(delta: float):
	var x_val = Input.get_axis("move_left", "move_right")
	var y_val = Input.get_axis("move_up", "move_down")
	var vel = Vector2(x_val, y_val).normalized() * Constants.player_speed
	velocity = vel
	
func _process(delta):
	get_parent().get_node("FoodDetection").position = position
	get_parent().get_node("Mouth").position = position
	

func _physics_process(delta):
	set_velocity_from_input(delta)

	move_and_slide()
