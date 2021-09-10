extends Node

var bridgeQuestCurrent = 0
var bridgeQuestText = "Per permettere ai falegnami di\nriparare il ponte, devi\nrendere più sicuro il bosco\n\nSconfiggi 5 Bug: "
var bridgeQuestActive
var bridgeQuestCompleted

func initialize():
	bridgeQuestActive = "false"
	bridgeQuestCompleted = "false"
	bridgeQuestCurrent = 0
