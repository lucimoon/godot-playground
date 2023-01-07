extends KinematicBody2D

export var speed = 400
onready var _animated_sprite = $AnimatedSprite


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		_animated_sprite.scale.x = abs(_animated_sprite.scale.x)
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		_animated_sprite.scale.x = -abs(_animated_sprite.scale.x)
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
			
	if velocity.length() > 0:
		move_and_collide(velocity.normalized() * delta * speed)
		_animated_sprite.play("run")
	else:
		_animated_sprite.play("idle")

