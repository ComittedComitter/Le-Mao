extends StaticBody2D

@onready var sprite_2d = $Sprite2D
@onready var sprite_2_wrecked = $Sprite2_wrecked
var wrecked = false


func wreck():
	if !wrecked:
		sprite_2d.visible = false
		sprite_2_wrecked.visible = true
		wrecked = true
