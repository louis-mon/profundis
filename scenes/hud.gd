extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func update_ui(player: Player):
	%EatGauge/Fill.size_flags_stretch_ratio = player.energy_ratio
	%EatGauge/Empty.size_flags_stretch_ratio = 1 - player.energy_ratio

