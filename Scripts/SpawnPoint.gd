extends BattleMode

#Global Variable to store all the spawnpoints

@export var point1: CollisionShape2D = null
@export var point2: CollisionShape2D = null
@export var point3: CollisionShape2D = null

#variables for is a point is in use
var Point1Used
var Point2Used
var Point3Used

@export var SpawnPoints: Array[CollisionShape2D]

# Called when the node enters the scene tree for the first time.
func _ready():
	selectSpawnLocation()
	# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	


#
#    Further Dev -- Find a better way to expand the types without hardcoding
#                   Probably want a better way of spawning
#                   Could be cool if could spawn randomly without spawn points 
#

#Randomizes the amount of spawned enemies and locations, pretty poor design but functional
func selectSpawnLocation():
	var amount = EnemyInfo.Amount
	var t = EnemyInfo.Type	
		#var SpawnNum = randi_range(0,2)
		
	
	if amount == 1:
		Spawn(1,t)
	elif amount == 2:
		Spawn(2,t)
	elif amount== 3:
		Spawn(3,t)
			

#Toggles the images for the spawned enemies

#
# This is completely awful and I need a better way to spawn them
#
#
func Spawn(number, type):
	if(type == "Skeleton"):
		for i in number:
			print_debug(i)
			SpawnPoints[i].get_child(0).show()
			EnemyInfo.SpawnEnemy()
			HealthLabel[i].text = "Health: " + str(EnemyInfo.Enemies[i].Health)
		
		#if(number == 0):
		#	point1.get_child(0).show()
		#	EnemyInfo.SpawnEnemy()
		#	$"../CollisionShape2D/Label".text = "Health: " + str(EnemyInfo.Enemies[0].Health)
		#elif(number == 1):
		#	point1.get_child(0).show()
		#	point2.get_child(0).show()
		#	EnemyInfo.SpawnEnemy()
		#	EnemyInfo.SpawnEnemy()
		#	$"../CollisionShape2D/Label".text = "Health: " + str(EnemyInfo.Enemies[0].Health)
		#	$"../CollisionShape2D/Label".text = "Health: " + str(EnemyInfo.Enemies[1].Health)
		#elif(number == 2):
		#	point1.get_child(0).show()
		#	point2.get_child(0).show()
		#	point3.get_child(0).show()
		#	EnemyInfo.SpawnEnemy()
		#	EnemyInfo.SpawnEnemy()
		#	EnemyInfo.SpawnEnemy()
		#	$"../CollisionShape2D/Label".text = "Health: " + str(EnemyInfo.Enemies[0].Health)
		#	$"../CollisionShape2D/Label".text = "Health: " + str(EnemyInfo.Enemies[1].Health)
		#	$"../CollisionShape2D/Label".text = "Health: " + str(EnemyInfo.Enemies[2].Health)

	
