# res://autoload/GameStateManager.gd
extends Node

enum GameLoadType { NEW_GAME, LOAD_GAME }
var current_game_load_type: GameLoadType = GameLoadType.NEW_GAME # Default to new game

# Path to main game scene
const MAIN_GAME_SCENE_PATH = "res://scenes/guild_base/guild_base.tscn"

func start_new_game():
	print("GameStateManager: Starting New Game")
	current_game_load_type = GameLoadType.NEW_GAME
	# Transition to the main game scene
	get_tree().change_scene_to_file(MAIN_GAME_SCENE_PATH)

func load_save_game():
	print("GameStateManager: Attempting to Load Game")
	current_game_load_type = GameLoadType.LOAD_GAME
	# --- Basic Save Game Check (Placaholder) ---
	# var save_file_exists = FileAccess.file_exists("user://savegame.dat")
	# if not save_file_exists:
	# print("No save file found. Cannot load")
	# Optionally, disable load button or show a message on the menu
	# For now, we'll just proceed to the main scene, which will handle it
	# return # Or still go to main scene and let it handle save
	
	# Transition to the main game scene
	# The main game scene's _ready() function will check current_game_load_type
	get_tree().change_scene_to_file(MAIN_GAME_SCENE_PATH)
	
func quit_game():
		print("GameStateManager: Quitting Game")
		get_tree().quit()

# This function would be called by your main game scene's _ready()
func should_initialize_as_new_game() -> bool:
	return current_game_load_type == GameLoadType.NEW_GAME
