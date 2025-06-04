extends Node2D

var debug_items_enabled = false
@export var enemy_health_bars_enabled = false  # This is just local to UI, not global

func _ready() -> void:
	var popup = $MenuButton.get_popup()
	popup.add_check_item("Debug Items")           
	popup.add_check_item("Enemy Health Bars")     

	# Connect signal from popup
	popup.connect("id_pressed", self._on_menu_item_pressed)

func _on_menu_item_pressed(id: int) -> void:
	match id:
		0:
			toggle_debug_items()
		1:
			toggle_enemy_healthbar()

func toggle_debug_items(): 
	debug_items_enabled = !debug_items_enabled
	var popup = $MenuButton.get_popup()
	popup.set_item_checked(0, debug_items_enabled)
	
	$DecreaseHP.visible = debug_items_enabled
	$IncreaseHP.visible = debug_items_enabled

func toggle_enemy_healthbar():
	# Update the GLOBAL variable in Globalvars singleton
	Globalvars.enemy_health_bars_enabled = !Globalvars.enemy_health_bars_enabled
	
	# Emit the signal from the GLOBAL singleton
	Globalvars.emit_signal("healthbar_toggled", Globalvars.enemy_health_bars_enabled)

	var popup = $MenuButton.get_popup()
	popup.set_item_checked(1, Globalvars.enemy_health_bars_enabled)
