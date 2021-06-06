extends MarginContainer

onready var number_label = $display/healthBar/background/number
onready var bar = $display/healthBar/guage
onready var score = $display/score/background/number
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var player_max_health = $"../wizard".max_health
	bar.max_value = player_max_health



func _process(delta):
	number_label.text = str($"../wizard".health)
	bar.value = $"../wizard".health
	score.text = str($"../wizard".score)
