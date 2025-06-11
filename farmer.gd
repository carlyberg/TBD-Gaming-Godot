extends CharacterBody2D

var farmer_direct : Vector2
var farmer_speed := 900.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_left") or Input.is_action_just_released("ui_right") or Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_down") :
		farmer_direct.x = Input.get_axis("ui_left", "ui_right")
		farmer_direct.y = Input.get_axis("ui_up", "ui_down")
		farmer_direct = farmer_direct.normalized()
		
		velocity = farmer_direct * farmer_speed * delta
			
		if farmer_direct.x < 0 && farmer_direct.y == 0:
			animated_sprite.animation = "walk_left"
		
		if farmer_direct.x > 0 && farmer_direct.y == 0:
			animated_sprite.animation = "walk_right"
			
		if farmer_direct.y < 0:
			animated_sprite.animation = "walk_up"
			
		if farmer_direct.y > 0:
			animated_sprite.animation = "walk_down"
		
		
		
	else:
		velocity = Vector2(0, 0)
		
	move_and_slide()
	
