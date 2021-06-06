extends Area2D
export var speed : int = 300
export var moveDist: int=300
onready var startX : float = position.x
onready var targetX : float = position.x + moveDist

var screen_size


func _ready():
	screen_size = get_viewport_rect().size
	

func _physics_process(delta):
	position.x = move_to(position.x, targetX, speed * delta)
	if position.x == targetX:
		if targetX == startX:
			targetX = position.x + moveDist
		else:
			targetX = startX

func move_to (current, to, step): 
	var new = current
 
	if new < to:
		new += step
 
		if new > to:
			new = to
			
	else:
		new -= step
 
		if new < to:
			new = to
 
	return new


func _on_goblin_body_entered(body):
	if body.name == "fireball":
		queue_free()
	if body.name == "wizard":
		$"../wizard".health -= 20
