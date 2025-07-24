class_name Morph
extends Node

@export
var animation_name: String
@export
var move_speed: float = 300

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

# Hold a reference to the parent so that it can be controlled by the state
var parent: Player

func enter() -> void:
	parent.animations.play(animation_name)

func exit() -> void:
	pass

func process_input(event: InputEvent) -> Morph:
	return null

func process_frame(delta: float) -> Morph:
	return null

func process_physics(delta: float) -> Morph:
	return null
