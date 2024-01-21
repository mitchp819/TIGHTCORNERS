extends Area2D
signal collision_occur
signal collision_avoided

@export var uper_angle: int

@export var lower_angle: int

var pressed = false
var collided = false
var previous_rotation = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
var collision_angle
var mouse_org_difference = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(false)
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
		return
	elif pressed:
		previous_rotation.push_front(self.global_rotation)
		self.look_at(get_global_mouse_position())
		self.rotate(-mouse_org_difference)
		previous_rotation.pop_back()
	pass


func _on_area_entered(area):
	emit_signal("collision_occur")
	collision_angle = self.global_rotation
	collided = true
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
