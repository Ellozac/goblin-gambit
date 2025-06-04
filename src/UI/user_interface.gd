extends Node2D
var debug_items_enabled = false

func _ready() -> void:
	var popup = $MenuButton.get_popup()
	popup.add_check_item("Debug Items") # This makes a checkable item
	popup.add_check_item("Enemy Health Bars") # This makes a checkable item
	popup.g


func _process(delta: float) -> void:
	if $MenuButton.get_popup().is_item_checked(0):
		$DecreaseHP.disabled = !debug_items_enabled
		$IncreaseHP.disabled = !debug_items_enabled
	else:
		$DecreaseHP.disabled = !debug_items_enabled
		$IncreaseHP.disabled = !debug_items_enabled
