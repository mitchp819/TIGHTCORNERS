extends Area2D
var pressed = false
var collided = false
var collision_angle
var previous_rotation = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

var move_pressed = false
var previous_position = [Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0),Vector2(0,0)]
var collision_position
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if pressed && collided:
		var prev_index = 3
		for i in previous_rotation.size()-1:
			if(previous_rotation[i] == collision_angle):
				prev_index = i+1
		self.global_rotation = previous_rotation[prev_index]
		pressed = false
		move_pressed = false
		return
	elif pressed:
		previous_rotation.push_front(self.global_rotation)
		self.look_at(get_global_mouse_position())
		previous_rotation.pop_back()
	
	if(move_pressed&&collided):
		var prev_index = 3
		for i in previous_position.size()-1:
			if(previous_position[i] == collision_position):
				prev_index = i+1
		self.position = previous_position[prev_index]
		pressed = false
		move_pressed = false
		return
	elif move_pressed:
		previous_position.push_front(self.position)
		self.global_position = get_global_mouse_position()
		previous_position.pop_back()
	pass


func _on_button_button_down():
	pressed = true
	pass # Replace with function body.


func _on_button_button_up():
	pressed = false
	pass # Replace with function body.


func _on_area_entered(area):
	collision_angle = self.global_rotation
	collision_position = self.global_position
	collided = true
	pass # Replace with function body.


func _on_area_exited(area):
	collided = false
	pass # Replace with function body.


func _on_move_button_down():
	move_pressed = true
	pass # Replace with function body.


func _on_move_button_up():
	move_pressed= false
	pass # Replace with function body.
