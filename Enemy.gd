extends Node2D

enum States { IDLE, FOLLOW }
enum Type { RED, GREEN, BLUE, WHITE }

var health = 100

const MASS = 7.0
const ARRIVE_DISTANCE = 10.0

export(float) var speed = 70.0
var _state = States.FOLLOW
var _type = Type.GREEN

var _path = []
var _target_point_world = Vector2()
var _target_position = Vector2()

var _velocity = Vector2()

var hit = false


func _ready():
	_change_state(States.FOLLOW)
	self.add_to_group("Enemy")
	

func _process(_delta):
	
	if _state != States.FOLLOW:
		return
	var _arrived_to_next_point = _move_to(_target_point_world)
	if _arrived_to_next_point:
		_path.remove(0)
		if len(_path) == 0:
			_change_state(States.IDLE)
			reached_destination()
			return
		_target_point_world = _path[0]
		
	#$Label.text = str(health)
	if health<1: 
		self.queue_free()
		get_tree().root.get_child(0).get_child(0).coin += 100
		
	update()
		
func _draw():
	var clr
	var clr2
	if _type == Type.RED: 
		clr = Color.red
		clr2 = Color.darkred
	if _type == Type.GREEN: 
		clr = Color.green
		clr2 = Color.darkgreen
	if _type == Type.BLUE: 
		clr = Color.blue
		clr2 = Color.darkblue
	

	draw_arc($Sprite.position, $Area2D/CollisionShape2D.shape.radius,0,2*PI,50,clr2,3.0)
	draw_arc($Sprite.position, $Area2D/CollisionShape2D.shape.radius,0,2*PI * health/100 ,50,clr,2.0)

	
	
func hit():
	pass
	
	
func reached_destination():
	get_tree().root.get_child(0).get_child(0).health -= 10 #Tilemap node
	queue_free()

func _move_to(world_position):
	var desired_velocity = (world_position - position).normalized() * speed
	var steering = desired_velocity - _velocity
	_velocity += steering / MASS
	position += _velocity * get_process_delta_time()
	rotation = _velocity.angle()
	return position.distance_to(world_position) < ARRIVE_DISTANCE


func _change_state(new_state):
	if new_state == States.FOLLOW:
		_path = _path
		if not _path or len(_path) == 1:
			_change_state(States.IDLE)
			return
		# The index 0 is the starting cell.
		# We don't want the character to move back to it in this example.
		_target_point_world = _path[1]
	_state = new_state
	
func set_target_position(target, path):
	_target_position = target
	_path = path
	_change_state(States.FOLLOW)

