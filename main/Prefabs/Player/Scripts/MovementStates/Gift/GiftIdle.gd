extends State

@export_group("Gift Movement")
@export var GiftMove: State
@export var GiftShoot: State

func enter() -> void:
	print("Gift: Idle")

func exit() -> void:
	pass

## Process Input for changing movement states
func process_input(event: InputEvent) -> State:
	if Input.get_vector("move_left","move_right","move_forward","move_back"):
		return GiftMove
	if Input.is_action_just_pressed("shoot"):
		return GiftShoot
	return null

func process_frame(delta: float) -> State:
	return null

## Function that dictates what this movement state does
func process_physics(delta: float) -> State:
	return null
