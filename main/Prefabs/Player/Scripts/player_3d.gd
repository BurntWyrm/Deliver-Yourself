class_name Player
extends RigidBody3D

@onready var morph_machine: Node = $MorphMachine

func _ready() -> void:
	# Initialize the state machine, passing a reference of the player to the states,
	# that way they can move and react accordingly
	morph_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	morph_machine.process_input(event)

func _physics_process(delta: float) -> void:
	morph_machine.process_physics(delta)

func _process(delta: float) -> void:
	morph_machine.process_frame(delta)
