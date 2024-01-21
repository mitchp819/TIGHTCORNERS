extends Node2D
var testerman = preload("res://CharactersAssembled/tester_man_assembled.tscn")
var l_shape_man = preload("res://CharactersAssembled/l_shaped_man.tscn")
var leaning_over = preload("res://CharactersAssembled/leaning_over_man.tscn")
var reclining_man = preload("res://CharactersAssembled/reclining_man.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_testerman_pressed():
	var instance = testerman.instantiate()
	add_child(instance)
	instance.position =  $spawn.position
	pass # Replace with function body.


func _on_l_shapeman_pressed():
	var instance = l_shape_man.instantiate()
	add_child(instance)
	instance.position = $spawn.position
	pass # Replace with function body.


func _on_leaning_over_pressed():
	var instance = leaning_over.instantiate()
	add_child(instance)
	instance.position = $spawn.position
	pass # Replace with function body.


func _on_reclining_man_pressed():
	var instance = reclining_man.instantiate()
	add_child(instance)
	instance.position = $spawn.position
	pass # Replace with function body.


func _on_home_pressed():
	get_tree().change_scene_to_file("res://Levels/home_screen.tscn")
	pass # Replace with function body.
