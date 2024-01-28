extends StaticBody2D

@onready var sprite_2d = $Sprite2D
@onready var sprite_2d_d = $Sprite2d_d
var opened = false


func open():
	if !opened:
		sprite_2d.visible = false
		sprite_2d_d.visible = true
		
		opened = true
