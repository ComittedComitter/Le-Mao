extends CharacterBody2D


const speed = 300.0
const reach = 52


var objects_to_check 
var nearest_obj_distance = 0

func _ready():
	# Populate objects_to_check with the nodes you want to consider
	# For example, you can set it through the editor or populate it in code
	objects_to_check = get_tree().get_nodes_in_group("my_group")


func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	if Input.is_action_pressed("wreck_button"):
	# Find the nearest object and print its name
		var nearest_object = find_nearest_object()
		if nearest_object != null:
			if nearest_obj_distance < reach:
				print("Nearest object:", nearest_object.name)
		else:
			print("No objects in the group")


func find_nearest_object() -> Object:
	objects_to_check = get_tree().get_nodes_in_group("furniture")
	var nearest_distance = 9999999
	var nearest_object: Object = null

	for obj in objects_to_check:
		# Ensure the object has a position property (works for Position2D, Spatial, etc.)
		if obj.has_method("get_position"):
			var distance = global_position.distance_to(obj.get_position())
			if distance < nearest_distance:
				nearest_distance = distance
				nearest_object = obj
				nearest_obj_distance = distance

	return nearest_object

