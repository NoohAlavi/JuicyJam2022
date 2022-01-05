extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var radius = 600
export var speed = 1
var angle = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	angle += speed * delta
	var oldAngle = angle - (speed * delta)
	var velocity = (Vector2(cos(angle), -sin(angle)) - Vector2(cos(oldAngle), -sin(oldAngle))).normalized()
	velocity *= radius
	rotation = -angle

	move_and_slide(velocity)
