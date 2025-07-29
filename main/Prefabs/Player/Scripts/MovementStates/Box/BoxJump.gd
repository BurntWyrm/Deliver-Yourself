extends State

@onready var jump_cd: Timer = %JumpCD

@export_group("Box Movement")
@export var BoxMove: State
@export var BoxIdle: State

@export_group("Stats")
@export var jump_power := 5
@export var jump_amount := 2
@export var can_jump := true

func enter() -> void:
	print("Box: Jump")
	
	if can_jump and jump_amount > 0:
		parent.apply_impulse(parent.basis.y * jump_power)
		parent.angular_velocity = Vector3.ZERO
		jump_amount -= 1
		print("Jumped. Remaining:", jump_amount)

		if jump_amount == 0:
			can_jump = false
			jump_cd.start()
	else:
		print("Jump on cooldown.")
func exit() -> void:
	pass

## Process Input for changing movement states
func process_input(event: InputEvent) -> State:
	if Input.get_vector("move_left","move_right","move_forward","move_back"):
		return BoxMove
	return null

func process_frame(delta: float) -> State:
	return null

## Function that dictates what this movement state does
func process_physics(delta: float) -> State:
	return null


func _on_jump_cd_timeout() -> void:
	jump_amount = 2
	can_jump = true
	print("Jump reset.")
