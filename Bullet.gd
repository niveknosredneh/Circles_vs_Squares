extends Node2D

var velocity = Vector2(0,0)

var max_distance

var start_position

# Called when the node enters the scene tree for the first time.
func _ready():
	start_position = position
	$Timer.start(2.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update()
	position += velocity.normalized()*300*delta
	if position.distance_to(start_position)>max_distance:
		queue_free()
	
	
func set_target(tpos):
	velocity = Vector2(tpos.x-position.x,tpos.y-position.y)
	
	
func _draw():
	draw_rect(Rect2($Area2D.position,$Area2D/CollisionShape2D.shape.extents),Color.red,true)


func _on_Area2D_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if area.get_parent().is_in_group("Enemy"):
		area.get_parent().health -=10
		area.get_parent().hit()
		queue_free()


func _on_Timer_timeout():
	queue_free()
