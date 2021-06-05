extends KinematicBody2D
var speed : int = 300
var vel : Vector2 = Vector2()
var screen_size
var gravity : int = 800
var grounded : bool = false

func _ready():
	screen_size = get_viewport_rect().size
	vel.x += speed

func _physics_process(delta):
	var velocity = Vector2()
	vel = move_and_slide(vel, Vector2.UP)
	vel.y += gravity * delta
	#position.x = clamp(position.x, 25, screen_size.x-25)
	 


