extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	text = "L'MAO"
	position = Vector2(get_viewport().size.x/2 - size.x, get_viewport().size.y/6)
	add_theme_color_override("font_color", Color.SIENNA)
	 
