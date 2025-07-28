extends State

@export_group("Box Movement")
@export var BoxMove: State
@export var BoxIdle: State

@export_group("Stats")
@export var jump_power := 5
func enter() -> void:
	print("Box: Jump")
	parent.apply_impulse(parent.basis.y * 5)
	parent.angular_velocity = Vector3.ZERO

func exit() -> void:
	pass

## Process Input for changing movement states
func process_input(event: InputEvent) -> State:
	if Input.get_vector("move_left","move_right","move_forward","move_back"):
		return BoxMove
	else:
		return BoxIdle
	return null

func process_frame(delta: float) -> State:
	return null

## Function that dictates what this movement state does
func process_physics(delta: float) -> State:
	return null
