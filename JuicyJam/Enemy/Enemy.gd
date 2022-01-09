extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var radius = 300
export (float) var speed = 1
var angle = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	global_position = radius * Vector2(cos(angle), -sin(angle))
	$Sprite.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	angle += speed * delta
	global_position = radius * Vector2(cos(angle), -sin(angle))
	rotation = -angle
