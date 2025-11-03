extends StaticBody3D

@onready var mesh_instance_3d : MeshInstance3D = $MeshInstance3D
@onready var sub_viewport : SubViewport = $SubViewport

func _ready():
	var mat : Material = mesh_instance_3d.get_active_material(0)
	mat.albedo_texture = sub_viewport.get_texture()
	mat.emission_texture = sub_viewport.get_texture()
	
	input_event.connect(_on_input_event);

func _on_input_event(camera : Node, event : InputEvent, event_position : Vector3, normal : Vector3, shape_idx : int) -> void:
	var mouse3d = mesh_instance_3d.global_transform.affine_inverse() * event_position;
	var calculated2dPosition = Vector2(mouse3d.x, mouse3d.z);
	
	var planeSize = mesh_instance_3d.mesh.size;
	calculated2dPosition += planeSize / 2;
	calculated2dPosition /= planeSize;
	
	var mouse2d = calculated2dPosition * Vector2(sub_viewport.size);
	
	event.position = mouse2d;
	
	sub_viewport.push_input(event);
