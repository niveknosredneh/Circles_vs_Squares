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
	draw_rect(Rect2($HBoxContainer.rect_position+$HBoxContainer/VBoxContainer/HBoxContainer/Label.rect_position,Vector2($HBoxContainer/VBoxContainer/HBoxContainer/Label.rect_size.x,$HBoxContainer/VBoxContainer/HBoxContainer/Label.rect_size.y)),
		Color(100,100,100), false, 2.0)
	draw_rect(Rect2($HBoxContainer.rect_position+$HBoxContainer/VBoxContainer/HBoxContainer/Label3.rect_position,Vector2($HBoxContainer/VBoxContainer/HBoxContainer/Label3.rect_size.x,$HBoxContainer/VBoxContainer/HBoxContainer/Label3.rect_size.y)),
		Color(100,100,100), false, 2.0)
	draw_rect(Rect2($HBoxContainer.rect_position+$HBoxContainer/VBoxContainer/HBoxContainer/Label4.rect_position,Vector2($HBoxContainer/VBoxContainer/HBoxContainer/Label4.rect_size.x,$HBoxContainer/VBoxContainer/HBoxContainer/Label4.rect_size.y)),
		Color(100,100,100), false, 2.0)
	draw_rect(Rect2($HBoxContainer.rect_position+$HBoxContainer/VBoxContainer/Label2.rect_position,Vector2($HBoxContainer/VBoxContainer/Label2.rect_size.x,$HBoxContainer/VBoxContainer/Label2.rect_size.y)),
		Color(100,100,100), false, 2.0)
		
	# right HUD
	#1
	draw_rect(Rect2($HBoxContainer.rect_position+$HBoxContainer/HBoxContainer.rect_position+$HBoxContainer/HBoxContainer/Button.rect_position+Vector2(10,10),Vector2($HBoxContainer/HBoxContainer/Button.rect_size.x-20,$HBoxContainer/HBoxContainer/Button.rect_size.y-20)),
		Color(Color.firebrick.r,Color.firebrick.g,Color.firebrick.b,0.5), true, 2.0)
	if $HBoxContainer/HBoxContainer/Button.pressed:
		draw_rect(Rect2($HBoxContainer.rect_position+$HBoxContainer/HBoxContainer.rect_position+$HBoxContainer/HBoxContainer/Button.rect_position,Vector2($HBoxContainer/HBoxContainer/Button.rect_size.x,$HBoxContainer/HBoxContainer/Button.rect_size.y)),
			Color(100,100,100), false, 5.0)
	$HBoxContainer/HBoxContainer/Button.text = str(get_parent().red)
	
	#2	
	draw_rect(Rect2($HBoxContainer.rect_position+$HBoxContainer/HBoxContainer.rect_position+$HBoxContainer/HBoxContainer/Button2.rect_position+Vector2(10,10),Vector2($HBoxContainer/HBoxContainer/Button2.rect_size.x-20,$HBoxContainer/HBoxContainer/Button2.rect_size.y-20)),
		Color(Color.seagreen.r,Color.seagreen.g,Color.seagreen.b,0.5), true, 2.0)
	if $HBoxContainer/HBoxContainer/Button2.pressed:
		draw_rect(Rect2($HBoxContainer.rect_position+$HBoxContainer/HBoxContainer.rect_position+$HBoxContainer/HBoxContainer/Button2.rect_position,Vector2($HBoxContainer/HBoxContainer/Button2.rect_size.x,$HBoxContainer/HBoxContainer/Button2.rect_size.y)),
			Color(200,100,100), false, 5.0)
	$HBoxContainer/HBoxContainer/Button2.text = str(get_parent().green)
	
	#3		
	draw_rect(Rect2($HBoxContainer.rect_position+$HBoxContainer/HBoxContainer.rect_position+$HBoxContainer/HBoxContainer/Button3.rect_position+Vector2(10,10),Vector2($HBoxContainer/HBoxContainer/Button3.rect_size.x-20,$HBoxContainer/HBoxContainer/Button3.rect_size.y-20)),
		Color(Color.navyblue.r,Color.navyblue.g,Color.navyblue.b,0.5), true, 2.0)
	if $HBoxContainer/HBoxContainer/Button3.pressed:
		draw_rect(Rect2($HBoxContainer.rect_position+$HBoxContainer/HBoxContainer.rect_position+$HBoxContainer/HBoxContainer/Button3.rect_position,Vector2($HBoxContainer/HBoxContainer/Button3.rect_size.x,$HBoxContainer/HBoxContainer/Button3.rect_size.y)),
			Color(200,100,100), false, 5.0)
	$HBoxContainer/HBoxContainer/Button3.text = str(get_parent().blue)
	
	draw_rect(Rect2($HBoxContainer.rect_position+$HBoxContainer/HBoxContainer.rect_position+$HBoxContainer/HBoxContainer/Button.rect_position, $HBoxContainer/HBoxContainer.get_rect().size), Color(100,100,100), false, 2.0)


func _on_Button_toggled(button_pressed):
	if button_pressed:
		$HBoxContainer/HBoxContainer/Button2.pressed = false
		$HBoxContainer/HBoxContainer/Button3.pressed = false

func _on_Button2_toggled(button_pressed):
	if button_pressed:
		$HBoxContainer/HBoxContainer/Button.pressed = false
		$HBoxContainer/HBoxContainer/Button3.pressed = false

func _on_Button3_toggled(button_pressed):
	if button_pressed:
		$HBoxContainer/HBoxContainer/Button.pressed = false
		$HBoxContainer/HBoxContainer/Button2.pressed = false
