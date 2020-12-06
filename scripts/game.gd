extends Node2D

onready var bird = get_node("Bird")
onready var timereplay = get_node("TimeToReplay")
onready var label = get_node("Node2D/Control/Label")

var points = 0
var state = 1

const PLAYING = 1
const LOSING = 2

func _ready():
	pass 

func kill():
	bird.apply_impulse(Vector2(0, 0), Vector2(-1000, 0))
	get_node("BackAnim").stop()
	state = LOSING
	timereplay.start()
	get_node("HitSound").play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func score():
	points += 1
	label.set_text(str(points))
	get_node("ScoreSound").play()

func _on_TimeToReplay_timeout():
	get_tree().reload_current_scene()
