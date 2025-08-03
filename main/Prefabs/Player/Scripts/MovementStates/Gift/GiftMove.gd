extends State

@onready var gift_move_cd: Timer = %GiftMoveCD

@export_group("Gift Movement")
@export var GiftIdle: State
@export var GiftShoot: State

@export_group("Gift Movement Stats")
@export var forward_impulse := 1.5
@export var up_impulse := 3
@export var turning_torque := 3
@export var max_angular_speed := 2

var can_move: bool = true

func enter() -> void:
	print("Gift: Move")

func exit() -> void:
	pass

## Process Input for changing movement states
func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("shoot"):
		return GiftShoot
	return null

func process_frame(delta: float) -> State:
	## Camera Calculations
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_back")

	var forward := parent._camera.global_basis.z
	var right := parent._camera.global_basis.x

	var move_direction = forward * input_dir.y + right * input_dir.x
	move_direction.y = 0.0
	move_direction = move_direction.normalized()
	
	## Movement Functions
	if Input.is_action_pressed("move_left"):
		parent.apply_torque(Vector3(0, 1, 0) * turning_torque)
	if Input.is_action_pressed("move_right"):
		parent.apply_torque(Vector3(0, -1, 0) * turning_torque)
	if Input.is_action_pressed("move_forward") and can_move:
		parent.apply_impulse(parent.basis.y * up_impulse)
		parent.apply_impulse(parent.basis.x * forward_impulse)
		gift_move_cd.start()
		can_move = false
	if Input.is_action_just_pressed("move_back"):
		pass
	
	## Restricts rotational movement of the player
	if parent.angular_velocity.length() > max_angular_speed:
		parent.angular_velocity = parent.angular_velocity.normalized() * max_angular_speed
	return null

## Function that dictates what this movement state does
func process_physics(delta: float) -> State:
	return null


func _on_gift_move_cd_timeout() -> void:
	can_move = true
