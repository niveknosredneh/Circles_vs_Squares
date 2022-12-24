extends Node2D

var w = 72
var h = 72

var Grid = []

const Cell = preload("res://Cell.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	for y in (get_viewport().get_visible_rect().size.y / h):
		for x in (get_viewport().get_visible_rect().size.x / w):
			var CellInstance= Cell.instance()
			CellInstance.add_to_group("cells")
			CellInstance.pos = Vector2(x*w,y*h)
			self.add_child(CellInstance)



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _draw():
	pass



