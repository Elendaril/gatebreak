# "res://scripts/ui/UnitDetailsPanel/UnitDetailsPanel.tscn"
extends PanelContainer

signal panel_closed

# --- Core Info ---
@onready var full_portrait_rect: TextureRect = $MarginContainer/DetailsContent/HBoxContainer/FullPortrait # Adjust path
@onready var name_label: Label = $MarginContainer/DetailsContent/HBoxContainer/VBoxContainer/NameLabel # Adjust path
# ... (@onready vars for XP bar & text) ...

# --- Stats & Growths ---
@onready var stats_grid: GridContainer = $MarginContainer/DetailsContent/StatsGrid # Adjust path$MarginContainer/DetailsContent/StatsGrid
#@onready var growths_grid: GridContainer = $MarginContainer/DetailsContent/GrowthsGrid # Adjust path

@onready var close_button: Button = $MarginContainer/DetailsContent/CloseButton # Adjust path

var current_unit_data: RuntimeUnit

func _ready():
	close_button.pressed.connect(_on_close_button_pressed)
	visible = false # Start hidden

func display_unit_details(unit_data: RuntimeUnit):
	if not unit_data or not unit_data.unit_stats_instance: #or not unit_data.current_class_instance:
		printerr("UnitDetailsPanel: Invalid unit data received.")
		return

	current_unit_data = unit_data

	name_label.text = current_unit_data.display_name
	#class_label.text = "Class: %s" % current_unit_data.current_class_instance.class_name
	#level_label.text = "Level: %d (XP: %d/%d)" % [current_unit_data.current_level, current_unit_data.current_xp, get_xp_for_next_level(current_unit_data.current_level)] # You'll need get_xp_for_next_level()

	if current_unit_data.unit_stats_instance.portrait:
		full_portrait_rect.texture = current_unit_data.unit_stats_instance.portrait
	else:
		full_portrait_rect.texture = null # Or a default placeholder

	# Populate Stats Grid
	_populate_grid(stats_grid, _get_display_stats())

	# Populate Growths Grid
#	_populate_grid(growths_grid, _get_display_growths())

	# ... (populate skills, equipment lists later) ...

	visible = true

func _populate_grid(grid: GridContainer, data: Dictionary):
	# Clear previous entries
	for child in grid.get_children():
		child.queue_free()

	for key_text in data.keys():
		var key_label = Label.new()
		key_label.text = str(key_text) + ":"
		var value_label = Label.new()
		value_label.text = str(data[key_text])
		value_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		grid.add_child(key_label)
		grid.add_child(value_label)
		


func _get_display_stats() -> Dictionary:
	# This function should fetch the *final calculated stats* from current_unit_data
	# For now, let's use some placeholders from its unit_stats_instance
	# In reality, you'd call current_unit_data.recalculate_final_stats()
	# and then get current_unit_data.final_strength, final_vitality etc.
	print_debug(current_unit_data)
	return {
	#	"Max HP": current_unit_data.get_final_max_hp(), # Assuming these methods exist on RuntimeUnit
	#	"Max MP": current_unit_data.get_final_max_mp(),
		"Strength": current_unit_data.unit_stats_instance.strength,
		"Vitality": current_unit_data.unit_stats_instance.vitality,
		"Intelligence": current_unit_data.unit_stats_instance.intelligence,
		"Spirit": current_unit_data.unit_stats_instance.spirit,
		"Accuracy": current_unit_data.unit_stats_instance.accuracy,
		"Speed": current_unit_data.unit_stats_instance.speed,
		"Luck": current_unit_data.unit_stats_instance.luck
		# Add other relevant stats like Defense, M.Defense, Hit, Dodge, Crit
	}

func _get_display_growths() -> Dictionary:
	var us = current_unit_data.unit_stats_instance
	var uc = current_unit_data.current_class_instance
	return {
		"HP Growth": "%d%%" % (us.hp_growth + uc.hp_growth_bonus),
		"MP Growth": "%d%%" % (us.mp_growth + uc.mp_growth_bonus),
		"STR Growth": "%d%%" % (us.str_growth + uc.str_growth_bonus),
		# ... and so on for all growths
	}

func get_xp_for_next_level(level: int) -> int:
	# Placeholder - get this from GlobalStats.get_xp_for_level(level + 1)
	return (level + 1) * 100


func _on_close_button_pressed():
	visible = false
	panel_closed.emit()
