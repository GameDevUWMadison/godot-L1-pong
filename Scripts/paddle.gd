extends CharacterBody2D

# This script will make the paddle read from input and
# then move the paddle accordingly

# "@export" tag will allow these variables to be set in the
# inspector. These variables are the names of the actions
# specified in the project settings. This allows us to remap
# the actual buttons to different actions only in project settings 
# without having to change it in multiple places in actual scenes.
@export var up_action : String
@export var down_action : String

# this constant is used in multiple places in the code
# but it's an arbitrary number. We can change it as we please.
const SPEED = 360

# this callback function will be executed by the engine before 
# the first frame update.
func _ready():
	pass

# this callback function will be executed by the engine every 
# single frame (roughly 60 times per second, sometimes faster 
# or slower depending on hardware limitations)
func _physics_process(_delta):
	# remember that the y-axis is flipped from 
	# the usual cartesian plane.
	
	# velocity is a built-in property for CharacterBody2D
	velocity.y = 0
	if Input.is_action_pressed(up_action):
		velocity.y += -SPEED
	if Input.is_action_pressed(down_action):
		velocity.y += SPEED
		
	# move and slide automatically reads from the velocity property
	move_and_slide()
		
