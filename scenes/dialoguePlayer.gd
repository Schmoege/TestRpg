extends Node

#export (String, FILE, "*.json") var dialogueName = str("res://dialogues/",dialogueName,".json")
export (String) var dialogueName
#var dialogueKeys = [] #sidor av dialog
var dialogueText = ""
#var dialogueHeader = ""
var currentPage = 0;

signal dialogueStarted
signal dialogueEnded

func _ready():
	
	var interface = get_parent().get_node("dialogueUI")
	connect("dialogueStarted", interface, "showDialogue")

func startDialogue():
	currentPage = 0 #återställ för säkerhets skull
	loadAndIndexDialogue(dialogueName)
	emit_signal("dialogueStarted")
#	dialogueText = dialogueKeys[currentPage].text
#	dialogueHeader = dialogueKeys[currentPage].Header

func continueDialogue():
	currentPage += 1
	if currentPage == 3:
		emit_signal("dialogueEnded")
#	if currentPage == dialogueKeys.size():
#		emit_signal("dialogueEnded")

func loadAndIndexDialogue(fileName):
	if fileName == "dKomettomten":
		dialogueText = "Komettomten brände sig"
	else:
		dialogueText = "Öl"
#	var file = File.new()
##	var fileName = str("res://dialogues/",fileName,".json")
#	print(fileName)
#	if file.file_exists(fileName):
#		print("Finns jag?")
#		file.open(fileName, file.READ)
#		var dialogue = parse_json(file.get_as_text())
#		print(dialogue)
#		dialogueKeys.clear()
#		for key in dialogue:
#			dialogueKeys.append(dialogue[key])
#		return dialogue