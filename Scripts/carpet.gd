extends Node2D

@onready var sprite_2d = $Sprite2D
@onready var sprite_2d_2 = $Sprite2D2

var wrecked = false

func wreck():
	if !wrecked:
		sprite_2d.visible = false
		sprite_2d_2.visible = true
		wrecked = true
