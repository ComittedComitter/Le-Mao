extends CharacterBody2D

var speed = 150
@onready var animated_sprite_2d = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	if direction.x > 0:
		animated_sprite_2d.play("Right")
	if direction.x < 0:
		animated_sprite_2d.play("Left")
	if direction.y < 0:
		animated_sprite_2d.play("Back")
	if direction.y > 0:
		animated_sprite_2d.play("Front")
