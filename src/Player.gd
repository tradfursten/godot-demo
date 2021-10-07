extends KinematicBody2D

var velocity = Vector2(0, 0)

const SPEED = 180
const GRAVITY = 35
const JUMPFORCE = -600

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED

	velocity.y = velocity.y + GRAVITY

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMPFORCE

	velocity = move_and_slide(velocity, Vector2.UP)

	if is_on_floor():
		velocity.x = lerp(velocity.x, 0, 0.5)
