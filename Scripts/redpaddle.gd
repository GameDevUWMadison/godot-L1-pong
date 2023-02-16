extends KinematicBody2D

const SPEED = 500

func _process(delta):
	var yInput = 0
	if Input.is_key_pressed(KEY_W):
		yInput -= 1
	elif Input.is_key_pressed(KEY_S):
		yInput += 1
		
	position.y += delta * SPEED * yInput
