extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.pressed.connect(_button_pressed)

func _button_pressed():
	get_parent().get_parent().health -= 10
