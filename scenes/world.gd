extends Node2D

signal on_update_ui(player: Player)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Camera2D.position = $Player.position

func _on_player_on_update_ui(player):
	on_update_ui.emit(player)
