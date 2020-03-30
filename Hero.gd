extends KinematicBody

#onready var Camera = get_parent().get_node("Camera")
#export var ray_length = 100

func _physics_process(delta):
#	var mouse_position = Camera.get_viewport().get_mouse_position()
#	var from = Camera.project_ray_origin(mouse_position)
#	var to = from + Camera.project_ray_normal(mouse_position) * ray_length
	
#	DrawLine3D.Draw_Line3D(0, from+Vector3(0.01,0.01,0.01),to , Color.red, 5)
#	print(from)
#	print(to)
	
	#look_at(to,Vector3.UP)
	#translation = Vector3(to.x,to.y,to.z)
	rotation.x = 0
	rotation.z = 0
	
	#print(mouse_position)
	#var beta_angle = asin(mouse_position.y)
	#print(rad2deg(beta_angle))
	#rotation.y = beta_angle
	
	#look_at(Vector3(mouse_position.y,0,mouse_position.x),Vector3(0,1,0))
	

#	var from = Camera.project_ray_origin(get_viewport().get_mouse_position())
#	var to =  Camera.project_ray_normal(get_viewport().get_mouse_position())
	

#	look_at(to, Vector3.UP)
	
#var dropPlane  = Plane(Vector3(0, 0, 1), z)
#var position3D = dropPlane.intersects_ray(
#                             camera.project_ray_origin(position2D),
#                             camera.project_ray_normal(position2D))

