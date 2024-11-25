extends Node

var CurrentPos
var StartPos

#Links to the physical buttons, 
@export var FireButton1: Button
@export var FireButton2: Button
@export var FireButton3: Button

# Called when the node enters the scene tree for the first time.
func _ready():
	StartPos = Vector2(-100,100)
	CurrentPos = StartPos 
	FireButton1.hide()
	FireButton2.hide()
	FireButton3.hide()
	# Replace with function body.


#Tracks the indicators position and handles the 'X' action
func _process(delta):
	
	$"../Indication".position = CurrentPos + Vector2(10,0)
	CurrentPos = $"../Indication".position
	if(CurrentPos.x > 700):
		CurrentPos = Vector2(-100,100)
		$"../Indication".position = CurrentPos
		
	if(Input.is_action_just_pressed("click_button")):
		fire(CurrentPos)
		
	updateHealth()
	#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
#Updates the label upon entering battlemode
func _on_battle_scene_battlemode():
	updateLabel()
	
#Actually updates the label
func updateLabel():
	$"../BattleLabel".set_text(EnemyInfo.Enemy.Class)
	#Input.mouse_mode =Input.MOUSE_MODE_CONFINED_HIDDEN
	
	

#
#     Further Dev -- Find a better way than the buttons, cant use buttons without set spawn points
#



#Detects the indicators position relative to the buttons and kills the enemy
func fire(pos) -> bool:
	if(GunManager.GunAmmo[GunManager.currentEquipped] == 0):
		return false;

	if(pos.x <= FireButton1.position.x+100 and pos.x >= FireButton1.position.x-100):
		hit(1)
	elif(pos.x <= FireButton2.position.x+100 and pos.x >= FireButton2.position.x-100):
		hit(2)
	elif(pos.x <= FireButton3.position.x+100 and pos.x >= FireButton3.position.x-100):
		hit(3)
		
	GunManager.GunAmmo[GunManager.currentEquipped] -= 1;
	return true
		
		
		
func hit(num):
	print_debug(EnemyInfo.Enemies[0].Health)
	EnemyInfo.Enemies[0].changeHealth(-50)
	
	
func updateHealth():
		$"../CollisionShape2D/Label".text = "Health: " + str(EnemyInfo.Enemies[0].Health)
		#$"../CollisionShape2D2/Label".text = "Health: " + str(EnemyInfo.Enemies[i].Health)
		#$"../CollisionShape2D3/Label".text = "Health: " + str(EnemyInfo.Enemy.Health)
	

#Disables the enabled enemies
func kill(num):
	if(num == 1):
		$"../SpawnControl".point1.hide()
	elif(num == 2):
		$"../SpawnControl".point2.hide()
	elif(num == 3):
		$"../SpawnControl".point3.hide()

		
	 # Replace with function body.
