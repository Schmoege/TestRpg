extends Area2D

export (String) var infoText
export (String) var dialogueName
signal playerOnHouse
signal playerNotAtHouse

func _ready():
	connect("body_entered", self, "playerOnHouse") #body_entered skickar med en parameter, body
	connect("body_exited", self, "playerLeftHouse")
	var player = get_parent().get_node("playerChar")
	connect ("playerOnHouse", player, "isOnHouse")
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func playerOnHouse(body):
#	var bodyType = body.get_name()
	emit_signal("playerOnHouse")
#	if bodyType ==  "KinematicBody2D": #StaticBody för PlayerMoveCollision triggar det annars
	get_parent().get_node("InfoText").setInfoText(infoText)
	var dialogue = _getDialoguePlayer()
	dialogue.dialogueName = dialogueName
#	print(str("Dialogue Name: ", dialogue.dialogueName))
	#body.get_name()

func playerLeftHouse(body):
#	emit_signal("playerNotAtHouse")
	get_parent().get_node("InfoText").resetText()
	var dialoguePlayer = _getDialoguePlayer()
	dialoguePlayer.dialogueName = ""
#	print(str("New Dialogue Name: ", dialoguePlayer.dialogueName))

func _getDialoguePlayer():
	return get_parent().get_node("dialoguePlayer")
