extends Node

export var max_deg_away_from_player = 90
export (PackedScene) var enemy_scene
const Enemy = preload("res://Enemy/Enemy.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	var e : Enemy = enemy_scene.instance()
	var deg1 = (int(rad2deg(Global.player.angle)) - max_deg_away_from_player) % 360
	var deg2 = (int(rad2deg(Global.player.angle)) + max_deg_away_from_player) % 360
	
	# Swap variables so deg1 < deg2
	if (deg1 > deg2):
		var temp = deg1
		deg1 = deg2
		deg2 = temp
	
	var diff = abs(deg1 - deg2)
	e.angle = deg2rad(randi() % diff + deg1)
	
	var dir = randi() % 2
	if (dir == 0):
		dir = -1
	
	e.speed = e.speed * dir
	
	add_child(e)
	
	
