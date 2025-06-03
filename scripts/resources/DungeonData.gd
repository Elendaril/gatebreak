#DungeonData.gd
@icon("res://resources/portal_icon.png") # for inspector view
extends Resource

class_name DungeonData

@export_group("Dungeon Info")
@export var dungeon_name: String = "Mysterious Dungeon"
@export_multiline var description: String = "A brief description of this dungeon."
@export var overworld_icon: Texture2D = preload("res://resources/portal_icon.png")
@export var can_be_escaped: bool = true

enum DungeonTheme { 
	GENERIC, 
	JUNGLE, 
	CAVES, 
	RUINS, 
	VOLCANO 
	# Add more as needed
}
@export var theme: DungeonTheme = DungeonTheme.GENERIC

enum GateColor {
	WHITE, # no monsters, only resources
	GREEN, # low difficulty
	BLUE,  # low-medium difficulty
	YELLOW, # medium difficulty
	ORANGE, # medium-high difficulty
	RED, # high difficulty, escaping is impossible, dungeon must be closed by defeating the boss
	BLACK # extreme difficulty, escaping is impossible, dungeon must be closed by defeating the boss
}

@export var recommended_level: int = 1
# @export var entry_splash_image: Texture2D # For the overview screen

@export_group("Dungeon Structure")
# This will be Array[RoomData] once RoomData.gd is defined
@export var rooms: Array[Resource] = [] 
@export var starting_room_id: String = "room_0" # Example ID
