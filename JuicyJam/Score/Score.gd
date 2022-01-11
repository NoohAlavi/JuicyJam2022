extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.score = self

func _process(delta):
	text = str(score)
	print(str(score) + "-> score")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func add(n):
	score += n


func _on_Timer_timeout():
	add(1)

