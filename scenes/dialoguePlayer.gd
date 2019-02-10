extends Node

export (String) var dialogueName
var dialogueKeys = [] #sidor av dialog
var dialogueText = ""
var dialogueHeader = ""
var currentPage = 0;

signal dialogueStarted
signal dialogueEnded
signal resumePlay

func _ready():
	var interface = get_parent().get_node("dialogueUI")
	connect("dialogueStarted", interface, "showDialogue")
	connect("dialogueEnded", interface, "showLastPage")
	var player = get_parent().get_node("playerChar")
	connect("resumePlay", player, "getMovableAgain")
	var HUD = get_parent().get_node("InfoText")
	connect("dialogueStarted", HUD, "hideInfoText")
	connect("resumePlay", HUD, "showInfoText")

func startDialogue():
	currentPage = 0 #återställ för säkerhets skull
	loadAndIndexDialogue(dialogueName)
	setDialogue()
	emit_signal("dialogueStarted")
	if dialogueKeys.size() == 1:
		emit_signal("dialogueEnded")

func continueDialogue():
	currentPage += 1
	setDialogue()
	if currentPage == dialogueKeys.size()-1:
		emit_signal("dialogueEnded")

func loadAndIndexDialogue(fileName):

	var file = File.new()
	var path = str("res://dialogues/",fileName,".json")
	if file.file_exists(path):
		file.open(path, file.READ)
		var text = file.get_as_text()
		var dialogue = parse_json(text)
		dialogueKeys.clear()
		for key in dialogue:
			dialogueKeys.append(dialogue[key])
		file.close()
		return dialogue

func setDialogue():
	dialogueText = dialogueKeys[currentPage].text
	dialogueHeader = dialogueKeys[currentPage].name

func endDialogue():
	dialogueKeys.clear() #Töm gammal dialog
	emit_signal("resumePlay")