extends Node

signal Interact_Hit
signal Interact_Leave

@export var Type: String = "Zombie"
@export var Enemy: bool = false
@export var Amount: int = 0
@export var Class: String = "Normal"
# Called when the node enters the scene tree for the first time.

#
#       Further Dev -- Maybe consider a seperate file for interactions and enemy interactions
#

func _ready():
	$"Interact Shape".set # Replace with function body.


func _on_body_entered(body):
	if body.name == "Player":
		print_debug("Interact Enter Test")
	Interact_Hit.emit(self) # Replace with function body.


func _on_body_exited(body):
	if body.name == "Player":
		print_debug("Interact Exit Test") 
	Interact_Leave.emit()# Replace with function body.
