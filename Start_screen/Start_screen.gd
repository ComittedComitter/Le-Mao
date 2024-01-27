extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	_draw()
	
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _draw():
	var r1 = Rect2(Vector2(0,0), Vector2(get_viewport().size.x/3, get_viewport().size.y))
	var r2 = Rect2(Vector2(1 * get_viewport().size.x/3,0), Vector2(get_viewport().size.x/3, get_viewport().size.y))
	var r3 = Rect2(Vector2(2 * get_viewport().size.x/3,0), Vector2(get_viewport().size.x/3, get_viewport().size.y))
	draw_rect(r1, Color.BLUE, true)
	draw_rect(r2, Color.WHITE, true)
	draw_rect(r3, Color.RED, true)
