extends Area2D
class_name Bullet

export var speed = 1.25
export var dir = 1
var angle = PI / 2
var radius = 400

func _physics_process(delta):
	angle += speed * delta
	global_position = Vector2(cos(angle), -sin(angle)) * radius
	rotation = -angle + (PI/2)

func _on_DespawnTimer_timeout():
	queue_free()
