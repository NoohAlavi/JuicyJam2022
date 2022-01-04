extends KinematicBody2D
class_name Player

export var radius = 600
export var base_speed = 1
export var velocity = Vector2.ZERO
var angle = PI / 2

var speed = base_speed

func _physics_process(delta):
	var dir = round(Input.get_action_strength("move_left") - Input.get_action_strength("move_right"))
	if dir != 0:
		speed = base_speed * dir
	
	if Input.is_action_just_pressed("swap_dir"):
		speed *= -1
	
	angle += speed * delta
	var oldAngle = angle - (speed * delta)
	velocity = (Vector2(cos(angle), -sin(angle)) - Vector2(cos(oldAngle), -sin(oldAngle))).normalized()
	
	velocity *= radius
	print(velocity)
	rotation = -angle + (PI/2)

	move_and_slide(velocity)


"""
old code
will not currently work as it is for Area2D and player is KinematicBody2D

extends Area2D
class_name Player

export var radius = 600
export var base_speed = 1
var angle = 0

var speed = base_speed

func _physics_process(delta):
	angle += speed * delta
	global_position = Vector2(cos(angle), -sin(angle)) * radius
	rotation = -angle + (PI/2)
	
	var dir = ceil(Input.get_action_strength("move_left") - Input.get_action_strength("move_right"))
	if dir != 0:
		speed = base_speed * dir
	
	if Input.is_action_just_pressed("swap_dir"):
		speed *= -1
"""
