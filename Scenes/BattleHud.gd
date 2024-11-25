extends CanvasLayer

@export var GunImg: Array[String] = ["res://Assets/vecteezy_pixel-speech-bubbles-vector-isolated_30797531.jpg","res://Assets/Skeleton_01_White_Idle.png","res://ExclamationTex2D.tres"];


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	updateGun(GunManager.GunType.PISTOL) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		$Control/Panel/Label/Label.text = str(GunManager.GunAmmo[GunManager.currentEquipped]);


func _on_run_away_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Main.tscn") # Replace with function body.


func _on_Gun_Select_Button_pressed() -> void:
	$Control/Panel/PopupPanel.show() # Replace with function body.


func _on_Gun_Option_One_pressed() -> void:
	updateGun($Control/Panel/PopupPanel/TextureButton.guns)
	


func updateGun(Gun):
	GunManager.equipGun(Gun)
	$Control/Panel/ActiveGun.texture_normal = load(GunImg[Gun])
	
	$Control/Panel/Label.text = (GunManager.getGunType(GunManager.currentEquipped) + " Ammo: ")
	 # Replace with function body.
