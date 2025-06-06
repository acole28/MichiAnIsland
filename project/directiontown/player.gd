extends CharacterBody2D


@export var max_speed := 100
var acceleration := 200
var deceleration := 150

var queue = [null] #using null to avoid errors



func _physics_process(delta: float) -> void:
	move()
	move_and_slide()
	
	
func move():
	#placing and removing input in queue
	for input in ["move_left", "move_right", "move_up", "move_down"]:
		if Input.is_action_just_pressed(input): 
			queue.push_back(input)
		if Input.is_action_just_released(input): 
			queue.erase(input)
			$AnimatedSprite2D.stop()
			$AnimatedSprite2D.frame = 1
		
	#checks direction is #1 in queue and then executes code
	match queue.back():
		"move_left": velocity = Vector2(-max_speed, 0)
		"move_right": velocity = Vector2(max_speed, 0)
		"move_up": velocity = Vector2(0, -max_speed)
		"move_down": velocity = Vector2(0, max_speed)
		_: velocity = Vector2(0,0) #nothing pressed
		
	#changes animation depending on which direction player is moving
	if velocity.x > 0:
		$AnimatedSprite2D.play("walk_right")
	if velocity.x < 0:
		$AnimatedSprite2D.play("walk_left")
	if velocity.y > 0:
		$AnimatedSprite2D.play("walk_down")
	if velocity.y < 0:
		$AnimatedSprite2D.play("walk_up")
		
		
