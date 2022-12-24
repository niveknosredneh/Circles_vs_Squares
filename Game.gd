extends Node2D

var game_running = false

var level = 0
var level_colours = [Color(0.75,1.0,0.75),Color(0.85,0.95,0.75),Color(0.75,1.0,0.75)]

var health = 100
var coin = 500


var red = 0
var green = 0
var blue = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update()
	$HUD/HBoxContainer/VBoxContainer/HBoxContainer/Label.text = "$" + str(coin)
	$HUD/HBoxContainer/VBoxContainer/HBoxContainer/Label3.text = str($TileMap.mob_num) + "/" + str($TileMap.mob_total)
	$HUD/HBoxContainer/VBoxContainer/HBoxContainer/Label3.text += "\n" + str($TileMap.enemies_left) + " left"
	$HUD/HBoxContainer/VBoxContainer/HBoxContainer/Label4.text = str(health) + "%"
	
	if game_running:
		var step = 0.001
		if $CanvasModulate.color.r>level_colours[level].r: $CanvasModulate.color.r -=step
		elif $CanvasModulate.color.r<level_colours[level].r: $CanvasModulate.color.r +=step
		if $CanvasModulate.color.g>level_colours[level].g: $CanvasModulate.color.g -=step
		elif $CanvasModulate.color.g<level_colours[level].g: $CanvasModulate.color.g +=step
		if $CanvasModulate.color.b>level_colours[level].b: $CanvasModulate.color.b -=step
		elif $CanvasModulate.color.b<level_colours[level].b: $CanvasModulate.color.b +=step
		
	# Game Over Conditions
	if health <= 0:
		reset()
		$TileMap.reset()
		
	# Next Mob Conditions
	if len(get_tree().get_nodes_in_group("Enemy")) == 0 and $TileMap.enemies_left == 0:
		$TileMap.mob_num += 1
		$TileMap.enemies_left = $TileMap.mob_num
		
	# Next Level Conditions
		
func reset():
	health = 100
	coin = 500
	level = 0
	game_running = false
	var tween := create_tween().set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	tween.tween_property($Menu,"global_position", Vector2(0,0),0.8)
	
	

func _on_Start_Button_pressed():
	#$Menu.visible = false
	
	var tween := create_tween().set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_IN)
	tween.tween_property($Menu,"global_position", Vector2(-1500,0),0.8)
	game_running = true


func _on_Exit_Button_pressed():
	get_tree().quit()
	

func _draw():
	pass


func _on_Timer_timeout():
	pass # Replace with function body.

