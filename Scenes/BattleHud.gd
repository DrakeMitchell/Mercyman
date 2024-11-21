extends CanvasLayer

var image = load("res://ExclamationTex2D.tres")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass; # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_run_away_pressed() -> void:
	get_tree().quit() # Replace with function body.


func _on_Gun_Select_Button_pressed() -> void:
	$Control/Panel/PopupPanel.show() # Replace with function body.


func _on_Gun_Option_One_pressed() -> void:
	GunManager.equipGun($Control/Panel/PopupPanel/TextureButton.guns)
	$Control/Panel/ActiveGun.texture_normal = image
	 # Replace with function body.
