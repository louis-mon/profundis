class_name Cac extends Area2D

@export var tentacle_len: float = 100

var allow_attack = true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func ask_attack():
	if !allow_attack:
		return
	allow_attack = false
	var tween := create_tween()
	tween.tween_method(animate_tentacle, 0, tentacle_len, 0.3)
	tween.tween_method(animate_tentacle, tentacle_len, 0, 0.3)
	await tween.finished
	await get_tree().create_timer(1).timeout
	allow_attack = true
	
func animate_tentacle(extend: float):
	var shape := $Shape as CollisionPolygon2D
	shape.polygon[0].x = extend
