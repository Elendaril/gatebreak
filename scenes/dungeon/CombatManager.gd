# res://scenes/dungeon/CombatManager.gd
extends Node2D

# This signal will be emitted when the battle is over.
# The dictionary will contain results like {"victory": true, "xp_gained": 150, "loot": [...]}
signal combat_over(results: Dictionary)

# --- Node References (to be filled in as you build your scene) ---
@onready var player_grid = $PlayerGridContainer # Example path
@onready var enemy_grid = $EnemyGridContainer   # Example path
# ... add more @onready vars for UI elements like turn order display, action menu, etc.

# --- Combat State Variables ---
var turn_queue: Array = []           # An array to hold all combatants (player and enemy instances)
var current_combatant_index: int = -1 # Index of the current unit in the turn_queue
var player_party_instances: Array = [] # Holds the RuntimeUnit objects for the player
var enemy_instances: Array = []        # Holds runtime instances for the enemies in this battle

# This is the main entry point, called by DungeonExploration.gd or your CombatTestScene.gd
func initialize_combat(encounter_data: EncounterData, player_party_runtime: Array[RuntimeUnit]):
	print("Initializing combat for encounter: ", encounter_data.encounter_name)
	
	# 1. Store the incoming data
	self.player_party_instances = player_party_runtime
	
	# 2. Spawn enemies based on encounter data
	_spawn_enemies(encounter_data)
	
	# 3. Set up the battle
	_start_combat()
	
func _spawn_enemies(encounter_data: EncounterData):
	print("Spawning enemies...")
	# TODO: Loop through encounter_data.formation
	# For each entry, create an enemy runtime instance/node,
	# add it to the 'enemy_instances' array,
	# and place its visual representation on the 'enemy_grid'.
	pass # Placeholder for now

func _start_combat():
	print("Combat started!")
	# TODO:
	# 1. Combine player_party_instances and enemy_instances into the 'turn_queue'.
	# 2. Sort the 'turn_queue' based on each unit's 'speed' stat.
	# 3. Set 'current_combatant_index' to 0.
	# 4. Call _next_turn() to start the first turn.
	pass # Placeholder for now
	
func _next_turn():
	# TODO: Logic to advance to the next combatant in the turn_queue.
	# This function will determine if it's a player's turn or an enemy's turn
	# and then call the appropriate function to handle it.
	pass # Placeholder for now

func _process_player_turn(player_unit: RuntimeUnit):
	# TODO: Enable player UI, wait for player to select an action (attack, skill, item).
	# Once an action is selected, resolve it.
	pass # Placeholder for now

func _process_enemy_turn(enemy_instance):
	# TODO: Run AI logic for the enemy to select a target and a skill.
	# Resolve the enemy's action.
	pass # Placeholder for now

func _check_win_loss_condition():
	# TODO: Check if all enemies are defeated (victory) or if all player units are defeated (loss).
	# If the battle is over, emit the 'combat_over' signal.
	# example: combat_over.emit({"victory": true, ...})
	pass # Placeholder for now
	
# ... other functions to handle damage calculation calls, status effects, etc. will go here ...
