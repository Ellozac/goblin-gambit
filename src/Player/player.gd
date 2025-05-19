extends CharacterBody2D
@export var speed: int = 125
var PLAYER_POS = position
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	PLAYER_POS = position
	$AnimatedSprite2D.play()
	var velocity = Vector2.ZERO
	if Input.is_action_pressed('left'):
		$AnimatedSprite2D.flip_h = true
		velocity.x -= 1
	if Input.is_action_pressed("right"):
		$AnimatedSprite2D.flip_h = false
		velocity.x += 1
	if Input.is_action_pressed('up'):
		velocity.y -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if velocity.length() > 0:
		$AnimatedSprite2D.animation = "Run"
		
		velocity = velocity.normalized() * speed
	else:
		rotation_degrees = 0
		#$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.animation = "Idle"

	position += velocity * delta
	
