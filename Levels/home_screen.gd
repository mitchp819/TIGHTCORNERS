extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Levels/apartmentleveltest.tscn")
	pass # Replace with function body.


func _on_sandbox_pressed():
	get_tree().change_scene_to_file("res://Levels/sandbox.tscn")
	pass # Replace with function body.


func _on_gallery_pressed():
	get_tree().change_scene_to_file("res://Levels/gallery.tscn")
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.
