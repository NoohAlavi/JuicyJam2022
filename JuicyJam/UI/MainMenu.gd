extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PlayButton_pressed():
	get_tree().change_scene("res://Game/Game.tscn")


func _on_CreditsBack_pressed():
	get_tree().change_scene("res://UI/MainMenu.tscn")


func _on_Credits_pressed():
	get_tree().change_scene("res://UI/Credits.tscn")


func _on_HowToPlay_pressed():
	get_tree().change_scene("res://UI/Tutorial.tscn")
