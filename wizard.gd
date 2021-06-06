extends KinematicBody2D
 
var screen_size  
var score : int = 0
var speed : int = 400
var jumpForce : int = 600
var gravity : int = 800
var FIREBALL = preload("res://fireball.tscn")
var max_health : int = 100
var health = max_health

 
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
	position.y = clamp(position.y, 25, screen_size.y+50)
	if Input.is_action_just_released("fire"):
		var fireball = FIREBALL.instance()
		get_parent().add_child(fireball)
		fireball.position = $Position2D.global_position
	
	if health <= 0:
		get_tree().change_scene("res://Game_Over.tscn")
	
	

