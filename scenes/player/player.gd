class_name Player extends CharacterBody2D

signal on_update_ui(player: Player)

var max_energy = 10

var nutriment_dict: Dictionary = Dicts.map_dict(FoodConfig.icon_map, func(_v, _i): return 0)

func set_velocity_from_input(delta: float):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var vel = direction * Constants.player_speed
	velocity = vel
	
func _process(delta):
	pass

func _physics_process(delta):
	set_velocity_from_input(delta)

	move_and_slide()

func eat_nutriment(nutriment: FoodConfig.Nutriment):
	if energy_total >= max_energy:
		return
	nutriment_dict[nutriment] += 1
	emit_signal("on_update_ui", self)

var energy_total: int:
	get:
		return nutriment_dict.values().reduce(func(a, b): return a + b, 0)

var energy_ratio: float:
	get:
		return float(energy_total) / max_energy
