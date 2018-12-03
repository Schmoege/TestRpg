extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	resetText()

func resetText():
	$Info.text = ""

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func setInfoText(text):
	$Info.text = text

func hideInfoText():
	hide()

func showInfoText():
	show()