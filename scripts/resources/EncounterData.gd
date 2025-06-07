# res://scripts/resources/EncounterData.gd
extends Resource
class_name EncounterData

@export var encounter_name: String = "New Encounter"
@export_multiline var description: String = "Internal notes about this encounter."


# This is the core of the resource. It's an array where each
# element will be an EncounterEnemyPlacement resource.
@export var formation: Array[EncounterEnemyPlacement] = []
