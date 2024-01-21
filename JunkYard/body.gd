extends Area2D
var collided
var move_pressed = false
var previous_position = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
var collision_position

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(false)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(move_pressed&&collided):
		var prev_index = 3
		for i in previous_position.size()-1:
			if(previous_position[i] == collision_position):
				prev_index = i+1
		self.position = previous_position[prev_index]
		move_pressed = false
		return
	elif move_pressed:
		previous_position.push_front(self.position)
		self.global_position = get_global_mouse_position()
		previous_position.pop_back()
	pass



func _on_area_entered(area):
	collision_position = self.global_position
	collided = true
	pass # Replace with function body.


func _on_area_exited(area):
	collided = false
	pass # Replace with function body.


func _on_texture_button_button_down():
	set_physics_process(true)
	move_pressed = true
	pass # Replace with function body.


func _on_texture_button_button_up():
	set_physics_process(false)
	move_pressed = false
	pass # Replace with function body.


func _on_limb_collision_occur():
	collision_position = self.global_position
	collided = true
	pass # Replace with function body.


func _on_limb_collision_avoided():
	collided = false
	pass # Replace with function body.
