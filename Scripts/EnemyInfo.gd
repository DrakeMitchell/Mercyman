extends Enemy

#Whether or not the player is the Battle scene
var InBattleScene = false

var EnemyNode
var EnemyNum = 0;
#var Type
#var Class
#var Health = 100;
var Amount


#Enemies information
@export var Enemies = []

func _ready():
	#tempEnemy = Enemy
	pass

func changeHealth(newHealth):
	super(newHealth)

func getInBattleScene():
	return InBattleScene

func setInBattleScene(new):
	InBattleScene = new

#Take the Interact Area's information about enemies
func makeEnemy(Area):
	Type = Area.Type
	Class = Area.Class
	Amount = Area.Amount
	Health = Area.Health
	
func setVariables(type,classs,health):
	super(type,classs,health)
	
func SpawnEnemy():
	var tempEnemy = Enemy.new()
	print_debug(tempEnemy)
	tempEnemy.setVariables(Type,Class,Health + EnemyNum)
	Enemies.push_back(tempEnemy)
	print_debug(Enemies[EnemyNum].Health)
	EnemyNum += 1
	

#connects to SendEnemyInfo to store enemy information between scenes
func _on_main_send_enemy_info(Area):
	EnemyNode = Area
	makeEnemy(Area)
