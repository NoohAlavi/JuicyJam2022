extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var radius = 600
export var speed = 60
var angle = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	angle += speed * delta
	global_position = Vector2(cos(angle), -sin(angle)) * radius
	rotation = -angle + (PI/2)
	if (Input.is_action_just_pressed("ui_left") || Input.is_action_just_pressed("ui_right")):
		speed *= -1
		
