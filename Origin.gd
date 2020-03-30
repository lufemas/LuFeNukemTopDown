extends MeshInstance

onready var Camera = get_parent().get_node("Camera")

func _physics_process(delta):
	translation = Camera.project_ray_origin(Camera.get_viewport().get_mouse_position())
