extends KinematicBody2D
class_name Player

export var radius = 600
export (float) var base_speed = 1
export var velocity = Vector2.ZERO
export var bullet_scene: PackedScene

var angle = PI / 2

var speed = base_speed
var is_jumping = false

func _ready():
	Global.player = self

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()
	if Input.is_action_just_pressed("jump"):
		is_jumping = true
		$AnimationPlayer.playback_speed = 1
		$AnimationPlayer.play("jump")
		
func get_angle():
	return angle

func get_dir():
	if speed > 0:
		return 1
	else:
		return -1

func _physics_process(delta):
	var dir = round(Input.get_action_strength("move_left") - Input.get_action_strength("move_right"))
	
	if Input.is_action_just_pressed("swap_dir"):
		dir *= -1
	
	if dir != 0:
		speed = base_speed * dir
	
	angle += speed * delta
	rotation = -angle + (PI/2)
	
	if (is_jumping):
		global_position = radius * Vector2(cos(angle), -sin(angle))
	else:
		var oldAngle = angle - (speed * delta)
		velocity = (Vector2(cos(angle), -sin(angle)) - Vector2(cos(oldAngle), -sin(oldAngle))).normalized()
		velocity *= radius
		velocity = move_and_slide(velocity)

func shoot():
	var new_bullet = bullet_scene.instance()
	new_bullet.position = position
	get_tree().root.add_child(new_bullet)

func end_jump():
	is_jumping = false

func die():
	Global.player_dead = true
	queue_free()
