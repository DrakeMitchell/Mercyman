extends Node2D

var Interacting = false

var cursor = load("res://Assets/Untitled.png")

signal ActivatePopup
signal SendEnemyInfo
signal Battlemode()

var Enemy

var interaction

var InBattleScene = EnemyInfo.getInBattleScene()


#
#    Further Dev -- Keep only vital things in this file, make everything better encapsulated and consise
#
#

func _ready():
	set_process_input(true)
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED_HIDDEN
	Input.set_custom_mouse_cursor(cursor)
	# Replace with function body.


func _process(delta):
	
	
	
	if Interacting:
		if not InBattleScene:
			if Input.is_action_just_pressed("Interact"):
				Popup()
			elif Input.is_action_just_pressed("Pause"):
				print_debug("test")
				get_tree().change_scene_to_file("res://Scenes/Start Menu.tscn")
	if not InBattleScene:
		if Input.is_action_just_pressed("Pause"):
			print_debug("test")
			get_tree().change_scene_to_file("res://Scenes/Start Menu.tscn")
	if InBattleScene:
		if Input.is_action_just_pressed("Interact"):
			Battlemode.emit()
		
		elif Input.is_action_just_pressed("Pause"):
			EnemyInfo.setInBattleScene(false)
			get_tree().change_scene_to_file("res://Scenes/Main.tscn")
			#$Player.set_postion(Vector2(100,100))
			#updateLabel()
			
			

#Uses the interaction to connect to Popup
func Popup():
	ActivatePopup.emit(interaction)
	pass

#Enables indicator and sets appropriate interaction variables for the Popup
func _on_interact_area_interact_hit(Area):
	$Player/Indicator.show()
	print_debug(Area.Type)
	if Area.Enemy == false:
		if Area.Type == "Door":
			interaction = "door"
			Interacting = true
		if Area.Type == "Item":
			interaction = "item"
			Interacting = true
	else:
		EnemyInfo.ripInfo(Area)
		change_the_scene()
		
		#isBattleScene()
		
#Changes the scene to the battle scene
func change_the_scene():
	EnemyInfo.setInBattleScene(true)
	get_tree().change_scene_to_file("res://Scenes/Battle Scene.tscn")
	

#Disables interaction and the indicators
func _on_interact_area_interact_leave():
	$Player/Indicator.hide()
	$Player/DialogPopupMain.hide()
	Interacting = false 
