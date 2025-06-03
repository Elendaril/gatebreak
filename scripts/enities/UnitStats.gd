#UnitStats.gd
@icon("res://resources/units_icon.png") # for inspector view
extends Resource

class_name  UnitStats

#Basic info
@export var unit_name: String = "Default Unit"
@export var description : String = "Basic description"
@export var portrait: Texture2D = preload("res://resources/art/units/hunters/portraits/placeholder.png")
@export var portrait_thumbnail: Texture2D = preload("res://resources/art/units/hunters/portraits/placeholder_thumbnail.png")

@export_group("Class")
@export var unit_class: String = "Warrior" # Placeholder, I need to load/link here actuall unit class with it's own skills, growth etc

@export_group("Base Stats")
@export var base_hp: int = 12
@export var base_mp: int = 10
@export var strength: int = 5 
@export var accuracy: int = 5 
@export var vitality: int = 4
@export var intelligence: int = 5
@export var spirit: int = 5
@export var speed: int = 5
@export var luck: int = 2

@export_group("Stat growths")
# Percent chance to increase stat on lvl up by one. If growth exceeds 100, leftover number is chance of another increase. If unit have 120 growth, there is 100% to get 1 stat point and 20% of getting two.
@export var hp_growth: int = 20 
@export var mp_growth: int = 20 
@export var str_growth: int = 30 
@export var acc_growth: int = 15
@export var vit_growth: int = 35
@export var int_growth: int = 25
@export var spr_growth: int = 25
@export var spd_growth: int = 10
@export var lck_growth: int = 5

@export_group("Special features")
@export var can_scout: bool = false
