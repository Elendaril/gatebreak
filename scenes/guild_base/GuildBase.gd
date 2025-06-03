# res://scenes/guild_base/GuildBase.gd
extends Node2D

@onready var roster_button: Button = $RosterButton
@onready var unit_list_panel: PanelContainer = $UnitListPanel # Adjust path
@onready var unit_list_content: VBoxContainer = $UnitListPanel/MarginContainer/ScrollContainer/UnitListContent
@onready var unit_details_panel: PanelContainer = $UnitDetailsPanel # Adjust path if needed

const UNIT_CARD_SCENE = preload("res://scenes/unit_card/UnitCard.tscn")

func _ready():
	roster_button.pressed.connect(_on_roster_button_pressed)
	unit_list_panel.visible = false # Ensure it's hidden at start
	unit_details_panel.visible = false
	unit_details_panel.panel_closed.connect(_on_unit_details_panel_closed) # Connect new signal
	if GameStateManager.should_initialize_as_new_game():
		print("GuildBase: Initializing as NEW GAME.")
		GuildManager.initialize_new_game_state() # Your existing GuildManager function
	else:
		print("GuildBase: Initializing from LOAD GAME.")
		# GuildManager.load_saved_game_data() # You'll need to implement this
		print("Load game logic to be implemented in GuildManager.")
		# For now, if you hit load without a save system, it might just start fresh
		# or ideally, GuildManager.load_saved_game_data() would handle missing save.

	# ... rest of your game scene setup ...
	# Example: get_node("YourUnitListUI").populate_list(GuildManager.get_recruited_units())

func _on_roster_button_pressed():
	unit_list_panel.visible = not unit_list_panel.visible # Toggle visibility
	if unit_list_panel.visible:
		populate_unit_list()

func populate_unit_list():
	# Clear previous cards
	for child in unit_list_content.get_children():
		child.queue_free()

	var recruited_units = GuildManager.get_recruited_units()
	if recruited_units.is_empty():
		var empty_label = Label.new()
		empty_label.text = "No units recruited yet."
		empty_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		unit_list_content.add_child(empty_label)
		return

	for unit_data in recruited_units:
			var card_instance = UNIT_CARD_SCENE.instantiate()
			unit_list_content.add_child(card_instance)
			
			if card_instance.has_method("set_unit_data"):
				card_instance.set_unit_data(unit_data)
			else:
				printerr("UnitCard scene is missing set_unit_data method.")
			
			# Connect the signal
			# Ensure _on_unit_card_selected_for_details exists in this script
			var err = card_instance.unit_card_selected.connect(_on_unit_card_selected_for_details)
			if err != OK:
				printerr("GuildBase: Failed to connect unit_card_selected signal for ", unit_data.display_name) # DEBUG
			else:
				print("GuildBase: Connected unit_card_selected for ", unit_data.display_name) # DEBUG


func _on_unit_card_selected_for_details(unit_data: RuntimeUnit):
	print("Displaying details for: ", unit_data.display_name)
	if unit_details_panel.has_method("display_unit_details"):
		unit_details_panel.display_unit_details(unit_data)
	# Optionally hide the unit list when showing details
	# unit_list_panel.visible = false

func _on_unit_details_panel_closed():
	# Decide what to do when details panel closes.
	# Maybe re-show the unit list if it was hidden, or go to another default view.
	# For now, just ensure it's hidden.
	unit_details_panel.visible = false
	# If you hid the unit list panel when opening details, you might want to show it again:
	# unit_list_panel.visible = true 
	# populate_unit_list() # Re-populate if necessary
