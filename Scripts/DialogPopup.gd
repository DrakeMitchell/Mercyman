extends Sprite2D

var Active = false


func _on_main_activate_popup(interaction):
	if(interaction == "door"):
		texture = load("res://Assets/vecteezy_pixel-speech-bubbles-vector-isolated_30797531.jpg")
		#
		#    Further Development -- Door and Item Specific Popup files or at least methods
		#
		#
		show()
		Active = true
	if(interaction == "item"):
		texture = load("res://Assets/vecteezy_exclamation-marks-icon-design-element-logo-element_5439438-1.jpg")
		show()
	if(interaction == "off"):
		hide()
	 # Replace with function body.
	
#Connects to Spawn
func _on_enemy_spawning(type):
	if(type == "Skeleton"):
		show()
		Active = true 
		#
		#     Further Development -- Enemy Specific Popup file
		#
		#
