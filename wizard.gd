extends KinematicBody2D
 
var screen_size  
var score : int = 0
var speed : int = 400
var jumpForce : int = 600
var gravity : int = 800
 
var vel : Vector2 = Vector2()
var grounded : bool = false

func _ready():
	screen_size = get_viewport_rect().size


func _physics_process(delta):
	var velocity = Vector2()
	vel.x = 0

# movement inputs
	if Input.is_action_pressed("ui_left"):
		vel.x -= speed
	if Input.is_action_pressed("ui_right"):
		vel.x += speed
	vel = move_and_slide(vel, Vector2.UP)
	vel.y += gravity * delta
	if Input.is_action_pressed("jump") and is_on_floor():
		vel.y -= jumpForce
	position.x = clamp(position.x, 25, screen_size.x-25)
	
	

