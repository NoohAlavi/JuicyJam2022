extends Area2D
class_name Bullet

export var speed = 2
var radius = 333

onready var angle = Global.player.get_angle()
onready var dir = Global.player.get_dir()

func _physics_process(delta):
	angle += speed * delta * dir
	global_position = Vector2(cos(angle), -sin(angle)) * radius
	rotation = -angle + (PI/2)

func _on_DespawnTimer_timeout():
	queue_free()

func _on_Bullet_area_entered(area):
	# If it collides with another bullet or enemy, destroy them both
	if typeof(area) == typeof(self):
		if (area.name.begins_with("Enemy")):
			Global.score.add(5)
			yield(wait(0.1), "timeout")
		area.queue_free()
		queue_free()
		
func wait(s):
	var t = Timer.new()
	t.set_wait_time(s)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	return t	

func _on_Bullet_body_entered(body):
	if body.name == "Player":
		var timer : Timer = $DespawnTimer
		if (timer.time_left < timer.wait_time - 0.5): # Check if the bullet didnt just spawn
			print("Hit Player!")
			Global.player.die()
