extends CanvasLayer
signal start_game
var score

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func show_game_over():
	show_message("Game Over")
	# Espereu fins que el MessageTimer hagi acabat de comptar.
	yield($MessageTimer, "timeout")
	$Message.text = "Dodge the\nCreeps!"
	$Message.show()
	# Feu un temporitzador one-shot i espereu que acabi.
	yield(get_tree().create_timer(1), "timeout")
	$StartButton.show()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func start_game():
	print("start game hud")
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")

func _on_Button_pressed():
	print("PRE_on_Button_pressed")
	$StartButton.hide()
	emit_signal("start_game")
	print("POST_on_Button_pressed")

func _on_MessageTimer_timeout():
	$Message.hide()
