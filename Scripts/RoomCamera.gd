extends Camera2D

const SCREEN_SIZE := Vector2(1152,648)
var cur_screen := Vector2(0,0)



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_as_top_level(true)# Replace with function body.
	global_position = get_parent().global_position
	update_position(cur_screen)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var parent_screen : Vector2 = (get_parent().global_position / SCREEN_SIZE).floor()
	if not parent_screen.is_equal_approx(cur_screen):
		update_position(parent_screen)
		
func update_position(new_screen: Vector2):
	cur_screen = new_screen
	global_position= cur_screen *SCREEN_SIZE + SCREEN_SIZE * 0.5
