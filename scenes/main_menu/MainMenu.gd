# res://scenes/main_menu/MainMenu.gd
extends Control

@onready var start_button: Button = $CenterContainer/MenuButtons/StartButton
@onready var load_button: Button = $CenterContainer/MenuButtons/LoadButton
@onready var exit_button: Button = $CenterContainer/MenuButtons/ExitButton

func _ready():
	start_button.pressed.connect(_on_start_button_pressed)
	load_button.pressed.connect(_on_load_button_pressed)
	exit_button.pressed.connect(_on_exit_button_pressed)

	# Placeholder: Check if a save game exists to enable/disable load button
	# if not GameStateManager.has_save_game(): # You'd need to implement has_save_game()
	#     load_button.disabled = true
	#     load_button.tooltip_text = "No save game found"

func _on_start_button_pressed():
	print("Start Game button pressed")
	GameStateManager.start_new_game() # Calls the function in your autoload

func _on_load_button_pressed():
	print("Load Game button pressed")
	GameStateManager.load_saved_game() # Calls the function in your autoload

func _on_exit_button_pressed():
	print("Exit button pressed")
	GameStateManager.quit_game() # Calls the function in your autoload
