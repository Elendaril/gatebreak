extends PanelContainer
# res://scenes/ui_elements/UnitCard.gd (or a similar path)

signal unit_card_selected(unit_data: RuntimeUnit) # For click later

@onready var portrait_thumbnail_rect: TextureRect = $ContentContainer/PortraitThumbnail
@onready var name_label: Label = $ContentContainer/InfoVBox/NameLabel
@onready var level_label: Label = $ContentContainer/InfoVBox/LevelLabel
#@onready var hp_progress_bar: ProgressBar = $ContentContainer/InfoVBox/HPBarContainer/HPProgressBar
#@onready var hp_text_value: Label = $ContentContainer/InfoVBox/HPBarContainer/HPTextValue
# @onready var mp_progress_bar: ProgressBar = $ContentContainer/InfoVBox/MPBarContainer/MPProgressBar
# @onready var mp_text_value: Label = $ContentContainer/InfoVBox/MPBarContainer/MPTextValue

var current_unit_data: RuntimeUnit # We'll pass the RuntimeUnit here
var hover_tween: Tween

func _ready():
	# Connect mouse signals for hover effect
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

	# Ensure the PanelContainer can receive mouse events for _gui_input
	mouse_filter = Control.MOUSE_FILTER_STOP

func set_unit_data(unit_data: RuntimeUnit):
	current_unit_data = unit_data
	update_display()

func update_display():
	if not current_unit_data or not current_unit_data.unit_stats_instance:
		name_label.text = "N/A"
		# Hide or set default for other elements
		return

	name_label.text = current_unit_data.display_name
	level_label.text = "Lvl: %d" % current_unit_data.current_level

	if current_unit_data.unit_stats_instance.portrait_thumbnail:
		portrait_thumbnail_rect.texture = current_unit_data.unit_stats_instance.portrait_thumbnail
	else:
		# Handle missing thumbnail, maybe load a default placeholder here too
		portrait_thumbnail_rect.texture = null # Or preload a generic placeholder

	# --- HP/MP ---
	# Assumes your RuntimeUnit has current_hp, final_max_hp, current_mp, final_max_mp
	# These would be calculated by your unit's recalculate_final_stats() method.
	# For this example, let's assume they exist:
#	var current_hp = current_unit_data.get_current_hp() # Placeholder for actual method/property
#	var max_hp = current_unit_data.get_final_max_hp()   # Placeholder
#	var current_mp = current_unit_data.get_current_mp() # Placeholder
#	var max_mp = current_unit_data.get_final_max_mp()   # Placeholder

#	hp_progress_bar.max_value = max_hp
#	hp_progress_bar.value = current_hp
#	hp_text_value.text = "%d/%d" % [current_hp, max_hp]

#	mp_progress_bar.max_value = max_mp
#	mp_progress_bar.value = current_mp
#	mp_text_value.text = "%d/%d" % [current_mp, max_mp]

# Placeholder functions - you need to ensure your RuntimeUnit class
# has these properties or methods to get current/max HP/MP.
# These values should be updated after stat recalculation.
# For example, in your RuntimeUnit.gd:
# var current_hp: int
# var final_max_hp: int # This is calculated by recalculate_final_stats()
# var current_mp: int
# var final_max_mp: int # Calculated by recalculate_final_stats()
# func get_current_hp(): return current_hp
# func get_final_max_hp(): return final_max_hp
# etc.

func _on_mouse_entered():
	if hover_tween and hover_tween.is_running():
		hover_tween.kill() # Stop any previous animation
	hover_tween = create_tween().set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	hover_tween.tween_property(self, "scale", Vector2(1.03, 1.03), 0.15)
	# Optional: Change self_modulate slightly to brighten
	hover_tween.tween_property(self, "self_modulate", Color(4, 4, 4), 0.4)

func _on_mouse_exited():
	if hover_tween and hover_tween.is_running():
		hover_tween.kill()
	hover_tween = create_tween().set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_IN)
	hover_tween.tween_property(self, "scale", Vector2(1.0, 1.0), 0.1)
	# Optional: Modulate back to normal
	hover_tween.tween_property(self, "self_modulate", Color(1.0, 1.0, 1.0), 0.1)

func _gui_input(event: InputEvent):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		print("UnitCard: Mouse button pressed on card.") # DEBUG
		if current_unit_data:
			print("UnitCard: Emitting unit_card_selected for unit: ", current_unit_data.display_name) # DEBUG
			unit_card_selected.emit(current_unit_data)
			get_viewport().set_input_as_handled()
		else:
			print("UnitCard: Clicked, but current_unit_data is null!") # DEBUG
