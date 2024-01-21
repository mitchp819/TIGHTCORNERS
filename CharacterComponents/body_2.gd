extends Area2D
signal collision_occur
signal collision_avoided

var total_hits = 0

var pressed = false
var collided = false
var previous_rotation = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
var collision_angle

var previous_position = [Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0)]
var collision_position = Vector2(0,0)
var mouse_org_difference = 0 
var mouse_position_difference = 0
var move_pressed = false
var is_moving = false
var mouse_inside = false



# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(false)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(is_moving&&collided):
		var prev_index = 1
		for i in previous_position.size()-1:
			if(previous_position[i] == collision_position):
				prev_index = i+1
		self.position = previous_position[prev_index]
		move_pressed = false
		is_moving = false
		return
	elif move_pressed:
		previous_position.push_front(self.position)
		self.global_position = get_global_mouse_position()-mouse_position_difference
		previous_position.pop_back()
	
	
	if pressed && collided:
		var prev_index = 1
		for i in previous_rotation.size()-1:
			if(previous_rotation[i] == collision_angle):
				prev_index = i+1
		self.global_rotation = previous_rotation[prev_index]
		pressed = false
		return
	elif pressed:
		previous_rotation.push_front(self.global_rotation)
		self.look_at(get_global_mouse_position())
		self.rotate(-mouse_org_difference)
		previous_rotation.pop_back()
	pass


func _input(event):
	if event.is_action_pressed("right_click") && mouse_inside :
		print("mouse click")
		set_physics_process(true)
		if not is_moving:
			mouse_position_difference = get_global_mouse_position() - self.global_position
			is_moving = true
		move_pressed = true
	if event.is_action_released("right_click"):
		move_pressed=false
		is_moving = false
		set_physics_process(false)


func hit():
	total_hits += 1
	$Label.text = "Hits:" + str(total_hits)
	#$Label.show()
	$hit.show()
	$bumb.play()
	await get_tree().create_timer(.3).timeout
	$hit.hide()
	#$Label.hide()


func _on_area_entered(area):
	emit_signal("collision_occur")
	collision_angle = self.global_rotation
	collision_position = self.global_position
	
	collided = true
	hit()
	
	pass # Replace with function body.


func _on_area_exited(area):
	emit_signal("collision_avoided")
	collided = false
	pass # Replace with function body.


func _on_texture_button_button_down():
	mouse_org_difference = self.get_angle_to(get_global_mouse_position())
	set_physics_process(true)
	pressed = true
	pass # Replace with function body.


func _on_texture_button_button_up():
	set_physics_process(false)
	pressed = false
	pass # Replace with function body.



func _on_mouse_entered():
	mouse_inside = true
	pass # Replace with function body.


func _on_mouse_exited():
	mouse_inside = false
	pass # Replace with function body.

func _on_limb_collision_occur():
	collision_position = self.global_position
	collided = true
	hit()
	pass # Replace with function body.


func _on_limb_collision_avoided():
	collided = false
	pass # Replace with function body.
