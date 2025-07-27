extends State

@export_group("Box Movement")
@export var BoxMove: State
@export var BoxJump: State

func enter() -> void:
	print("Box: Idle")

func exit() -> void:
	pass

## Process Input for changing movement states
func process_input(event: InputEvent) -> State:
	if Input.get_vector("move_left","move_right","move_forward","move_back"):
		return BoxMove
	if Input.is_action_just_pressed("jump"):
		return BoxJump
	return null

func process_frame(delta: float) -> State:
	return null

## Function that dictates what this movement state does
func process_physics(delta: float) -> State:
	return null
