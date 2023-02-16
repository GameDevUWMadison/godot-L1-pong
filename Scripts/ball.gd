extends KinematicBody2D

const SPEED = 550;
const START_POS = Vector2(512,300)

var direction = Vector2(7,2).normalized();

# This method is called by the engine every frame
func _process(delta):
	# move_and_collide will return an object with all the data pertaining to
	# the collision (if a collision occurred this frame)
	var collisionData = move_and_collide(direction * SPEED * delta)
	
	if collisionData:
		paddle_bounce()
		
	wall_bounce_if_needed()
	check_out_of_bounds()

# this function changes the direction to be opposite horizontally,
# as though the ball were bouncing off of a paddle
func paddle_bounce():
	direction.x *= -1;

# this function will check whether the ball has collided with the upper
# or lower edges of the screen and change its direction accordingly
func wall_bounce_if_needed():
	if position.y < 10:
		direction.y = abs(direction.y)
	if position.y > 590:
		direction.y = -abs(direction.y)

# this function will check whether the ball has slipped past a paddle and
# will reset the game accordingly
func check_out_of_bounds():
	if position.x < 0 || position.x > 1024:
		position = START_POS
		paddle_bounce() # send it to the other side this time
