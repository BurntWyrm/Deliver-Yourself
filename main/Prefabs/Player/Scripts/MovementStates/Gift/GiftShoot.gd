extends State

@export_group("Gift Movement")
@export var GiftIdle: State
@export var GiftMove: State

func enter() -> void:
	print("Gift: Shoot")

func exit() -> void:
	pass

## Process Input for changing movement states
func process_input(event: InputEvent) -> State:
	if Input.get_vector("move_left","move_right","move_forward","move_back"):
		return GiftMove
	else:
		return GiftIdle
	return null

func process_frame(delta: float) -> State:
	return null

## Function that dictates what this movement state does
func process_physics(delta: float) -> State:
	return null
