extends Area2D
export var speed : int = 300
export var moveDist: int=300
onready var startX : float = position.x
onready var targetX : float = position.x + moveDist
var rng = RandomNumberGenerator.new()
var screen_size
var goblin_type


func _ready():
	screen_size = get_viewport_rect().size
	rng.randomize()
	goblin_type = rng.randi_range(1, 2)
	

func _physics_process(delta):
	if goblin_type == 1:
		$AnimatedSprite.animation = "knife"
		$AnimatedSprite.play()
	if goblin_type == 2:
		$AnimatedSprite.animation = "club"
		$AnimatedSprite.play()
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
		$"../wizard".score += 30
		queue_free()
	if body.name == "wizard":
		$"../wizard".health -= 20
