extends CanvasLayer

#Stoppa det i ett canvasLayer så att det följer med. En enkel panel bara klistrar sig på en fast position
var lastPage = false
signal continueDialogue
signal endDialogue
var btnText = "Continue"

func _ready():
	$Block.hide()
	$Block/Button.connect("pressed", self, "buttonHandler")
	$Block/Button.text = btnText
	$Block/Text.text = ""
	$Block/Head.text = ""
	var dialogueNode = _getDialoguePlayer()
	connect("continueDialogue", dialogueNode, "continueDialogue")
	connect("endDialogue", dialogueNode,"endDialogue")

func setText():
	var dialogueNode = _getDialoguePlayer()
	$Block/Text.text = dialogueNode.dialogueText
	$Block/Head.text = dialogueNode.dialogueHeader

func showDialogue():
	$Block.show()
	setText()

func showLastPage():
	lastPage = true
	$Block/Button.text = "End this"

func buttonHandler():
	if lastPage:
		endDialogue()
		lastPage = false
		$Block/Button.text = btnText
	else:
		emit_signal("continueDialogue")
		setText()

func endDialogue():
	$Block.hide()
	emit_signal("endDialogue")
	
func _getDialoguePlayer():
	return get_parent().get_node("dialoguePlayer")