class_name Player
extends RigidBody3D

@onready var animations = $animations
@onready var morph_swap_machine = $MorphSwapMachine
@onready var box_state_machine = $MorphSwapMachine/BoxStateMachine

func _ready() -> void:
	# Initialize the morph swap machine, passing a reference of the player to the states,
	# that way they can move and react accordingly
	morph_swap_machine.init(self)

	## Initialize the box state machine, passing a reference of the player to the states,
	## that way they can move and react accordingly
	#box_state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	morph_swap_machine.process_input(event)
	#box_state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	morph_swap_machine.process_physics(delta)
	#box_state_machine.process_physics(delta)

func _process(delta: float) -> void:
	morph_swap_machine.process_frame(delta)
	#box_state_machine.process_frame(delta)
