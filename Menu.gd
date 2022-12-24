extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update()
	
func _draw():
		#left HUD
	draw_rect(Rect2($VBoxContainer.rect_position+$VBoxContainer/Start_Button.rect_position,$VBoxContainer/Start_Button.rect_size), Color(100,100,100), false, 2.0)
	draw_rect(Rect2($VBoxContainer.rect_position+$VBoxContainer/Options_Button.rect_position,$VBoxContainer/Options_Button.rect_size), Color(100,100,100), false, 2.0)
	draw_rect(Rect2($VBoxContainer.rect_position+$VBoxContainer/Exit_Button.rect_position,$VBoxContainer/Exit_Button.rect_size), Color(100,100,100), false, 2.0)
		

	

