extends State

@export_group("Gift Movement")
@export var GiftIdle: State
@export var GiftShoot: State

func enter() -> void:
	print("Gift: Move")

func exit() -> void:
	pass

## Process Input for changing movement states
func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("shoot"):
		return GiftShoot
	else:
		return GiftIdle
	return null

func process_frame(delta: float) -> State:
	return null

## Function that dictates what this movement state does
func process_physics(delta: float) -> State:
	return null
