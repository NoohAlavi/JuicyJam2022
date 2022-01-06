extends Area2D
class_name Bullet

export var speed = 1.25
var radius = 333

onready var angle = Global.player.get_angle()
onready var dir = Global.player.get_dir()

func _physics_process(delta):
	angle += speed * delta * dir
	global_position = Vector2(cos(angle), -sin(angle)) * radius
	rotation = -angle + (PI/2)

func _on_DespawnTimer_timeout():
	queue_free()
