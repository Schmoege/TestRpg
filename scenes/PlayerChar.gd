extends KinematicBody2D

var speed = 400

var onHouse = false
var isOccupied = false

var velocity = Vector2()

func _ready():
	$Camera2D.make_current()
#	connect("playerOnHouse", self, "isOnHouse") 

func getInput():
	velocity = Vector2() #Skapa ny för varje så inte man glider åt helvete
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x += -1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y += -1
	if Input.is_action_just_pressed("ui_select") && onHouse:
		var dialoguePlayer = get_parent().get_node("dialoguePlayer")
		dialoguePlayer.startDialogue()
		isOccupied = true
		return
	velocity = velocity.normalized() * speed

func _process(delta):
	if !isOccupied:
		getInput()
		move_and_collide(velocity * delta)

func isOnHouse():
	onHouse = true
	print(str(onHouse))

func getMovableAgain():
	isOccupied = false