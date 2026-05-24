extends Area2D

var ball = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start()




func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		if ball == true:
			ball = false
			body.balls += 1


func _on_timer_timeout() -> void:
	ball = true
