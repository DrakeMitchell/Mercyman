extends Node

#Whether or not the player is the Battle scene
var InBattleScene = false

var EnemyNode

#Enemies information
var Enemy = {
	Type = "",
	Class = "",
	Amount = "",
}

func getInBattleScene():
	return InBattleScene

func setInBattleScene(new):
	InBattleScene = new

#Take the Interact Area's information about enemies
func ripInfo(Area):
	Enemy.Type = Area.Type
	Enemy.Class = Area.Class
	Enemy.Amount = Area.Amount

#connects to SendEnemyInfo to store enemy information between scenes
func _on_main_send_enemy_info(Area):
	EnemyNode = Area
	ripInfo(Area)

