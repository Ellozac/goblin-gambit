extends CharacterBody2D
@export var speed: int = 125
var max_health = 100
var health = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AnimatedSprite2D.play()
	$AnimatedSprite2D.animation = "Idle"
	if enemy_health_bars_enabled:
		$RichTextLabel.visible = true
	else:
		$RichTextLabel.visible = false
