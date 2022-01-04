extends KinematicBody2D
class_name Player

export var radius = 600
export var base_speed = 1
export var velocity = Vector2.ZERO
export var bullet_scene: PackedScene

var angle = PI / 2

var speed = base_speed

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()

func _physics_process(delta):
	var dir = round(Input.get_action_strength("move_left") - Input.get_action_strength("move_right"))
	if dir != 0:
		speed = base_speed * dir
	
	angle += speed * delta
	var oldAngle = angle - (speed * delta)
	velocity = (Vector2(cos(angle), -sin(angle)) - Vector2(cos(oldAngle), -sin(oldAngle))).normalized()
	
	velocity *= radius
	rotation = -angle + (PI/2)

	velocity = move_and_slide(velocity)

func shoot():
	var new_bullet = bullet_scene.instance()
	new_bullet.position = position
	get_tree().root.add_child(new_bullet)
