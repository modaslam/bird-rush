extends RigidBody2D

var scene

func _ready():
	scene = get_tree().get_current_scene()
	set_process_input(true)


func _input(event):
	if event.is_action_pressed("touch"):
		on_touch()

func on_touch():
	if scene.state == scene.PLAYING:
		apply_impulse(Vector2(0, 0), Vector2(0, -1000))
		get_node("FlySong").play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
