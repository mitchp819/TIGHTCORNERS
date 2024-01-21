extends Node
var testerman = preload("res://CharactersAssembled/tester_man_assembled.tscn")
var l_shape_man = preload("res://CharactersAssembled/l_shaped_man.tscn")
var leaning_over = preload("res://CharactersAssembled/leaning_over_man.tscn")
var reclining_man = preload("res://CharactersAssembled/reclining_man.tscn")
var this_man_path
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_testermanbutton_pressed():
	var instance = testerman.instantiate()
	add_child(instance)
	instance.position =  $spawn.position
	this_man_path = $tester_man_assembled/body2/Label
	$tester_man_assembled/body2/Camera2D.set_enabled(true)
	$"charachter menu".hide()
	pass # Replace with function body.


func _on_recliningmanbutton_pressed():
	var instance = reclining_man.instantiate()
	add_child(instance)
	instance.position = $spawn.position
	this_man_path = $reclining_man/body2/Label
	$reclining_man/body2/Camera2D.set_enabled(true)
	$"charachter menu".hide()
	pass # Replace with function body.


func _on_lshapedmanbutton_pressed():
	var instance = l_shape_man.instantiate()
	add_child(instance)
	instance.position = $spawn.position
	this_man_path = $l_shaped_man/body2/Label
	$l_shaped_man/body2/Camera2D.set_enabled(true)
	$"charachter menu".hide()
	pass # Replace with function body.


func _on_leaningovermanbutton_pressed():
	var instance = leaning_over.instantiate()
	add_child(instance)
	instance.position = $spawn.position
	this_man_path = $leaning_over_man/body2/Label
	$leaning_over_man/body2/Camera2D.set_enabled(true)
	$"charachter menu".hide()
	pass # Replace with function body.


func _on_exit_area_entered(area):
	this_man_path.show()
	$CPUParticles2D.show()
	await get_tree().create_timer(5).timeout
	get_tree().change_scene_to_file("res://Levels/level_complete.tscn")
	pass # Replace with function body.



