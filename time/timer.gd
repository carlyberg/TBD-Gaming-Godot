extends Node

# Total real time for one in-game day in seconds (10 minutes = 600 seconds)
const SECONDS_PER_DAY := 600.0

var current_time := 0.0
var current_day := 1

signal new_day_started

func _process(delta: float) -> void:
	current_time += delta
	if current_time >= SECONDS_PER_DAY:
		current_time = 0.0
		current_day += 1
		emit_signal("new_day_started")

func get_day_progress() -> float:
	return current_time / SECONDS_PER_DAY
	

	
