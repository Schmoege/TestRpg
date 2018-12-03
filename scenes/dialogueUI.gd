extends CanvasLayer

#Stoppa det i ett canvasLayer så att det följer med. En enkel panel bara klistrar sig på en fast position
var lastPage = false
signal resumePlay

func _ready():
	$Block.hide()
	$Block/Button.connect("pressed", self, "resumePlay")
	var player = get_parent().get_node("playerChar")
	connect("resumePlay", player, "getMovableAgain")

func showDialogue():
	print("Showtime")
	$Block.show()
	var dialogueNode = get_parent().get_node("dialoguePlayer")
	$Block/Text.text = dialogueNode.dialogueText
	$Block/Head.text = "Greger"

func resumePlay():
	$Block.hide()
	emit_signal("resumePlay")