# "res://scenes/dev/CombatTestScene.tscn"
extends Control

# --- Scene Connections ---
@onready var player_unit_list: ItemList = $HBoxContainer/ControlPanel/VBoxContainer/PlayerUnitList
@onready var enemy_encounter_list: ItemList = $HBoxContainer/ControlPanel/VBoxContainer/EnemyEncounterList
@onready var start_combat_button: Button = $HBoxContainer/ControlPanel/VBoxContainer/StartCombatButton
@onready var combat_mount_point: Node = $HBoxContainer/CombatStage/SubViewport/CombatMountPoint

# --- Constants and Preloads ---
const HUNTER_DATA_PATH = "res://data/hunters/uniques/" # Path to your unique hunters
const ENCOUNTER_DATA_PATH = "res://data/encounters/" # Create this folder for EncounterData resources
#const COMBAT_SCENE = preload("res://scenes/dungeon/CombatEncounter.tscn")

# --- Stored Data ---
var available_hunters: Array[UnitStats] = []
#var available_encounters: Array[EncounterData] = [] # Assuming EncounterData.gd exists
var current_combat_instance: Node = null
