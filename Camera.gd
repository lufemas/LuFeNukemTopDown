extends Camera

onready var Camera = get_parent().get_node("Camera")
export var ray_length = 1000
onready var RayLookAt = get_parent().get_node("RayLookAt")
onready var Light = get_parent().get_node("Light")

func _physics_process(delta):
	var mouse_position = get_viewport().get_mouse_position()
	var from = project_ray_origin(mouse_position)
	var to = from + project_ray_normal(mouse_position) * ray_length
	
	var spaceState = get_world().direct_space_state
	var ray = spaceState.intersect_ray(from, to, [], 1, true, true)
	
	if ray:
		var rayCollisionPoint = ray.position
		

	RayLookAt.translation = from + Vector3(0.01,0.01,0.01)
	RayLookAt.cast_to = to 
	Light.translation = RayLookAt.get_collision_point()
	DrawLine3D.Draw_Line3D(0, from+Vector3(0.01,0.01,0.01),to , Color.red, 5)
	print(RayLookAt.is_colliding())
	print(from)

