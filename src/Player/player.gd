extends CharacterBody2D
@export var health = 0
@export var max_health = 1000
@export var speed = 125
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

	# Flip sprite horizontally
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	# Play the correct animation
	if velocity.length() == 0:
		$AnimatedSprite2D.animation = "Idle"
	else:
		$AnimatedSprite2D.animation = "Run"
	$AnimatedSprite2D.play()  # <- This is what was missing

func _physics_process(delta):
	get_input()
	move_and_slide()
	
func _ready() -> void:
	$ProgressBar.max_value = max_health
	health = max_health

func _process(delta: float) -> void:
	health = clamp(health, 0, max_health)
	$ProgressBar.value = health
	$Label.text = "{0}/{1}".format([health, max_health])
