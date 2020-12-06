extends Node2D

export var vel = -400

var scene

func _ready():
	scene = get_tree().get_current_scene()

func _physics_process(delta):
	if scene.state == scene.PLAYING:
		position += Vector2(vel * delta, 0)
	if(position.x < -100):
		queue_free()


func _on_Area2D_body_entered(body):
	if body.get_name() == "Bird":
		scene.kill()


func _on_Point_body_entered(body):
	scene.score()
