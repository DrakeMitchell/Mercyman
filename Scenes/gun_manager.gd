extends Node


enum GunType {PISTOL, SHOTGUN, RIFLE};
@export var startEquipped = GunType.PISTOL
@export var currentEquipped = null

@export var GunAmmo: Array[int] = [100,0,0];


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	currentEquipped = startEquipped
	 # Replace with function body.

func equipGun(gunType) -> void:
	currentEquipped = gunType
	print_debug("New Gun Equipped, Type:"); 
	print_debug(currentEquipped)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func getGunType(gunType) -> String:
	if gunType == 0:
		return "Pistol"
	elif gunType == 1:
		return "Shotgun"
	else:
		return "Rifle"
