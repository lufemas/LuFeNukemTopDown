extends KinematicBody

onready var Camera = get_parent().get_node("CameraMain")
export var ray_length = 1000
onready var RayLookAt = get_parent().get_node("RayLookAt")
onready var Light = get_parent().get_node("Light")
var from = Vector3()
var to = Vector3()
var angle = 0.0

func _physics_process(delta):
	
	var spaceState = get_world().direct_space_state
	var ray = spaceState.intersect_ray(from, to, [self], 1, true, true)
	
	if ray:
		var rayCollisionPoint = ray.position
		var objectPosition = translation
		
		#look_at(rayCollisionPoint,Vector3.UP)
		
		Light.translation = Vector3(rayCollisionPoint.x,32, rayCollisionPoint.z)
		
		rayCollisionPoint = objectPosition - rayCollisionPoint
		print(rayCollisionPoint)
		
		angle = Vector2(rayCollisionPoint.x, rayCollisionPoint.z).angle_to(Vector2(objectPosition.x,objectPosition.z))
		self.rotation = Vector3(0,angle,0)
		print(rad2deg(angle))
		

	RayLookAt.translation = from + Vector3(0.01,0.01,0.01)
	RayLookAt.cast_to = to 
	#Light.translation = RayLookAt.get_collision_point()
	#DrawLine3D.Draw_Line3D(0, from+Vector3(0.01,0.01,0.01),to , Color.red, 5)
	#print(RayLookAt.is_colliding())
	#print(from)

func _input(event):
	if event is InputEventMouseMotion:
		var mouse_position = Camera.get_viewport().get_mouse_position()
		from = Camera.project_ray_origin(mouse_position)
		to = from + Camera.project_ray_normal(mouse_position) * ray_length
	pass
