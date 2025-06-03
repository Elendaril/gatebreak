# res://autoload/GuildManager.gd
extends Node

var guild_roster: Array[RuntimeUnit] = [] # List of recruited units

# Called when the game starts (e.g., from main scene's _ready or a game state manager)
# Ensure this only runs for a NEW GAME, not when loading a save

func initialize_new_game_state():
	guild_roster.clear() # Make sure roaster is empty for a new game
	print("GuildManger: Initializing new game state with starting party.")
	
	# --- Add Rin ---
	var rin_stats_template_path = "res://data/hunters/Rin.tres"
	var rin_stats_template: UnitStats = load(rin_stats_template_path)
	
	if rin_stats_template:
	#	if rin_stats_template.unit_class # Check if starting class is assigned in Rin.res
		var rin_runtime_unit = RuntimeUnit.new(rin_stats_template,"Rin") # Pass the template
		add_unit_to_roster(rin_runtime_unit)
	else:
		printerr("Failed to load Rin's stats template at: ",rin_stats_template_path)

	# --- Add Lisa ---
	var lisa_stats_template_path = "res://data/hunters/Lisa.tres"
	var lisa_stats_template: UnitStats = load(lisa_stats_template_path)
	
	if lisa_stats_template:
		var lisa_runtime_unit = RuntimeUnit.new(lisa_stats_template)
		add_unit_to_roster(lisa_runtime_unit)
	else:
		printerr("Failed to load Lisa's stats template at: ",lisa_stats_template_path)

func add_unit_to_roster(unit: RuntimeUnit): # Or 'unit_runtime_data as argument name
	if unit and unit is RuntimeUnit: # Checking if not null and if type maches
		guild_roster.append(unit)
		print("Added %s to the guild roster. Roster size: %d" % [unit.display_name,guild_roster.size()])
	elif unit: #It's not null but noa a RuntimeUnit
		printerr("Attempted to add an object to roster that is not a RuntimeUnit: ",unit)
	else: # Unit is null
		printerr("Attempted to add a null unit to roster.")

# --- Functions for managing the roster ---
func get_recruited_units() -> Array[RuntimeUnit]:
	return guild_roster
	
# I will also need function for:
# TODO: Saving the guild_roster (serializing each RuntimeUnit)
# TODO: Adding newly recruited units during gameplay
# TODO: Removing units (if they die permanentyl or are dismissed)
