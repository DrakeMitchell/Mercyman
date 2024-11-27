extends CanvasLayer

@export var GunImg: Array[String] = ["res://Assets/vecteezy_pixel-speech-bubbles-vector-isolated_30797531.jpg","res://Assets/Skeleton_01_White_Idle.png","res://ExclamationTex2D.tres"];


var CurrentGun
@export var GunButtons: Array[TextureButton]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	updateGun(GunManager.GunType.PISTOL)
	CurrentGun = GunManager.currentEquipped
	disable_Active_Gun_Button()
 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		$Control/Panel/Label/Label.text = str(GunManager.GunAmmo[GunManager.currentEquipped]);
		#disable_Active_Gun_Button()


func _on_run_away_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Main.tscn") # Replace with function body.


func _on_Gun_Select_Button_pressed() -> void:
	$Control/Panel/PopupPanel.show() # Replace with function body.



#Disable the Currently active gun's button, Tried to do with a for loop but was getting
# really weird errors
func disable_Active_Gun_Button() -> void:
	if(CurrentGun == GunManager.GunType.PISTOL):
		$Control/Panel/PopupPanel/HBoxContainer/PistolButton.hide()
		$Control/Panel/PopupPanel/HBoxContainer/ShotgunButton.show()
		$Control/Panel/PopupPanel/HBoxContainer/RifleButton.show()
	elif(CurrentGun == GunManager.GunType.SHOTGUN):
		$Control/Panel/PopupPanel/HBoxContainer/ShotgunButton.hide()
		$Control/Panel/PopupPanel/HBoxContainer/RifleButton.show()
		$Control/Panel/PopupPanel/HBoxContainer/PistolButton.show()
	elif(CurrentGun == GunManager.GunType.RIFLE):
		$Control/Panel/PopupPanel/HBoxContainer/RifleButton.hide()
		$Control/Panel/PopupPanel/HBoxContainer/ShotgunButton.show()
		$Control/Panel/PopupPanel/HBoxContainer/PistolButton.show()
	

	

func _on_Rifle_Button_pressed() -> void:
	updateGun($Control/Panel/PopupPanel/HBoxContainer/RifleButton.guns)
	disable_Active_Gun_Button()
	


func _on_shotgun_button_pressed() -> void:
	updateGun($Control/Panel/PopupPanel/HBoxContainer/ShotgunButton.guns)
	disable_Active_Gun_Button() # Replace with function body.


func _on_pistol_button_pressed() -> void:
	updateGun($Control/Panel/PopupPanel/HBoxContainer/PistolButton.guns)
	disable_Active_Gun_Button() # Replace with function body.


func updateGun(Gun):
	GunManager.equipGun(Gun)
	$Control/Panel/ActiveGun.texture_normal = load(GunImg[Gun])
	CurrentGun = GunManager.currentEquipped
	$Control/Panel/Label.text = (GunManager.getGunType(GunManager.currentEquipped) + " Ammo: ")
	 # Replace with function body.
