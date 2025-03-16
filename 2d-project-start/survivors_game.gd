extends Node2D

func _ready():
	spawn_slime_mob()
	spawn_slime_mob()
	spawn_slime_mob()
	spawn_slime_mob()
	spawn_slime_mob()
	spawn_slime_mob()
	spawn_slime_mob()
	spawn_slime_mob()
	spawn_slime_mob()
	spawn_slime_mob()
	spawn_slime_mob()
	spawn_slime_mob()
	spawn_slime_mob()
	spawn_slime_mob()
	
func spawn_slime_mob():
	var new_slime_mob = preload("res://mob_slime.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_slime_mob.global_position = %PathFollow2D.global_position
	add_child(new_slime_mob)
	


func _on_timer_timeout():
	spawn_slime_mob()


func _on_player_health_depleted():
	%GameOverScreen.visible = true
	get_tree().paused = true
