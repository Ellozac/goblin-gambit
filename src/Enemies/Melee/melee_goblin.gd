extends CharacterBody2D
@export var speed: int = 125
var max_health = 100
var health = 0

func _ready():

	Globalvars.healthbar_toggled.connect(self._on_healthbar_toggled)
	$RichTextLabel.visible = Globalvars.enemy_health_bars_enabled
	health = max_health

func _on_healthbar_toggled(enabled: bool) -> void:
	$RichTextLabel.visible = enabled

func _process(delta):
	health = clamp(health, 0, max_health)
	$AnimatedSprite2D.play()
	$AnimatedSprite2D.animation = "Idle"
	$RichTextLabel.text = "{0}".format([health])
	
