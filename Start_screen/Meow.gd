extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	text = "Meow to see if anyone's home"
	position = Vector2(get_viewport().size.x/2 - size.x - 55, 4 * get_viewport().size.y/6)
	add_theme_color_override("font_color", Color.BLACK)


# Called every frame. 'delta' is the elapsed time since the previous frame.

