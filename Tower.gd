extends Node2D

const Bullet = preload("res://Bullet.tscn")

var targets = []

enum Type {  RED, GREEN, BLUE, WHITE }

var _type = Type.RED

var attack_targets = []

var hitting = []

var col = Vector2(0,0)

var wait_time = 0.2

var show_vision = false

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Tower")
	$Bullet_Timer.wait_time = wait_time


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	attack(targets)
	update()
	
	
func _draw():
	var clr
	if _type == Type.RED: clr = Color.red
	if _type == Type.GREEN: clr = Color.green
	if _type == Type.BLUE: clr = Color.blue
	if _type == Type.WHITE: clr = Color.white
	
	draw_rect(Rect2($Sprite.position-$Area2D/CollisionShape2D.shape.extents/2,Vector2($Area2D/CollisionShape2D.shape.extents)),clr,false,3.0)
	draw_circle($Sprite.position,4,clr)
	
	#draw_arc($Sprite.position,$Area2D_vision/CollisionShape2D.shape.radius,0,2*PI,100,Color(clr[0],clr[1],clr[2],0.2),2.0)
	
	for nme in attack_targets:
		draw_line(nme-position,$Sprite.position,Color.orange,3)
	attack_targets = []
	
	if len(targets)>0: draw_circle(col-position,4,clr)
		
	
func attack(targets):
	for enemy in targets:
		
		$RayCast2D.rotation = (enemy.position-position).angle()
		if $RayCast2D.is_colliding():
			hitting = $RayCast2D.get_collider()
			col = $RayCast2D.get_collision_point() 
			if hitting.get_parent().is_in_group("Enemy"):
				shoot(enemy)
		
func shoot(enemy):
	if _type == Type.RED:
		if $Bullet_Timer.is_stopped():
			var bullet = Bullet.instance()
			bullet.set_target(enemy.position - position)
			bullet.add_to_group("Bullet")
			bullet.max_distance = $Area2D_vision/CollisionShape2D.shape.radius
			self.add_child(bullet)
			$Bullet_Timer.start(wait_time)
	if _type == Type.GREEN:
		enemy.health-=1
		attack_targets.append(enemy.position)
		enemy.hit()
	if _type == Type.BLUE:
		pass


		

func _on_Area2D_vision_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if area.get_parent().is_in_group("Enemy"):
		targets.append(area.get_parent())

func _on_Area2D_vision_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	
	if area:
		targets.erase(area.get_parent())
		
		#if area.get_parent().is_in_group("Bullet"):
		#	area.get_parent().queue_free()

