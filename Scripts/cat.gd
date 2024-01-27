extends CharacterBody2D


const speed = 300.0
const reach = 52

@onready var cat_animation = $Cat_Animation

var objects_to_check 
var nearest_obj_distance = 0

func _ready():
	# Populate objects_to_check with the nodes we want to consider
	objects_to_check = get_tree().get_nodes_in_group("my_group")
	cat_animation.play()

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	# When pressing wreck, check if furniture is nearby
	if Input.is_action_pressed("wreck_button"): 
		var nearest_object = find_nearest_object()
		if nearest_object != null:
			if nearest_obj_distance < reach:
				if nearest_object.has_method("wreck"):
					nearest_object.wreck()
		else:
			print("Nope")


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

