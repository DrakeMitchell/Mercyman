extends Node
class_name Enemy

var Type = ""
var Class = ""
var Health = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func setVariables(type, classs, health):
	Type = type
	Class = classs
	Health = health
	
func changeHealth(newHealth):
	Health += newHealth

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _init() -> void:
	Type = "Skeleton"
	Class = "Normal"
	Health = 100
