extends Node

#Global Variable to store all the spawnpoints
@export var SpawnPoints: int = 3
@export var point1: CollisionShape2D = null
@export var point2: CollisionShape2D = null
@export var point3: CollisionShape2D = null

#variables for is a point is in use
var Point1Used
var Point2Used
var Point3Used

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
	var i = 0
	var t = EnemyInfo.Enemy.Type
	while(t == "Skeleton" and i < EnemyInfo.Enemy.Amount):
		i = i + 1
		var SpawnNum = randi_range(0,2)

		if SpawnNum == 0:
			Spawn(0,t)
		elif SpawnNum == 1:
			Spawn(1,t)
		elif SpawnNum == 2:
			Spawn(2,t)

#Toggles the images for the spawned enemies
func Spawn(n, t):
	if(t == "Skeleton"):
		if(n == 0):
			Point1Used = true
			point1.get_child(0).show()
		elif(n == 1):
			Point2Used = true
			point2.get_child(0).show()
		elif(n == 2):
			Point3Used = true
			point3.get_child(0).show()
	
