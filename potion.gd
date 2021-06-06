extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_potion_body_entered(body):
	if body.name == "wizard":
		if $"../wizard".health < 80:
			$"../wizard".health += 20
		elif $"../wizard".health < 100:
			$"../wizard".health = 100
		queue_free()
