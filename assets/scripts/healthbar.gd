extends ProgressBar
signal start_shaking
signal stop_shaking

@onready var timer = $Timer
@onready var damage_bar = $Damagebar

var health = 100 : set = _set_health

func _ready():
	init_health(89)

func _set_health(new_health):
	var prev_health = health
	health = min(max_value, new_health)
	value = health
	print("Health set to: ", health, " | Bar value: ", value)
	
	if health <= 0:
		queue_free()
		
	if health < prev_health:
		timer.start()
	else:
		damage_bar.value = health

func init_health(_health):
	health = _health
	max_value = health
	value = health
	damage_bar.max_value =   health
	damage_bar.value = health

func _on_timer_timeout() -> void:
	damage_bar.value = max_value - health
	health -= 1
	if (health <= 20) or (health >= 90):
		emit_signal("start_shaking")
	else:
		emit_signal("stop_shaking")
	
