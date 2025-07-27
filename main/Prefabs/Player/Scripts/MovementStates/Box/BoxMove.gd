extends State

@export_group("Box Movement")
@export var BoxJump: State
@export var BoxIdle: State

func enter() -> void:
	print("Box: Move")

func exit() -> void:
	pass

## Process Input for changing movement states
func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("jump"):
		return BoxJump
	else:
		return BoxIdle
	return null

func process_frame(delta: float) -> State:
	return null

## Function that dictates what this movement state does
func process_physics(delta: float) -> State:
	return null
