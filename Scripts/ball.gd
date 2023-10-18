extends CharacterBody2D


# this constant is used in multiple places in the code
# but it's an arbitrary number. We can change it as we please.
@export var INITIAL_VEL = Vector2(300, 200)
@export var ORIGINAL_POS = Vector2(576, 324)

# this callback function will be executed by the engine before 
# the first frame update.
func _ready():
	# remember that the y-axis is flipped from 
	# the usual cartesian plane.
	
	# velocity is a built-in property for CharacterBody2D
	velocity = INITIAL_VEL

# this callback function will be executed by the engine every 
# single frame (i.e. roughly 60 times per second, sometimes faster 
# or slower depending on hardware limitations)
func _physics_process(_delta):
	# move and slide automatically reads from the velocity property and moves
	# it the appropriate amount
	
	var pre_collision_velocity = velocity
	
	# move_and_slide will automatically factor in the time delta.
	move_and_slide()
	
	# we can check for collisions that happened during this frame
	var collision_data = get_last_slide_collision()
	
	if collision_data != null:
		velocity = pre_collision_velocity.bounce(collision_data.get_normal())
	
	# checking the win condition (the ball goes past someone else's paddle)
	# For now we are not keeping score.
	if position.x < 0:
		# ball crossed left side
		position = ORIGINAL_POS
		
	elif position.x > 1152:
		# ball crossed right side
		position = ORIGINAL_POS
	
	
	
	
