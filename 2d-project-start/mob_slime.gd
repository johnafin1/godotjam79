extends CharacterBody2D

var health = 3

@onready var player = get_node("/root/Game/Player")
var mob_ms = 300.0

func _ready():
	%Slime.play_walk()

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * mob_ms
	move_and_slide()

func take_damage(bullet_damage):
	health = health - bullet_damage
	%Slime.play_hurt()
	
	if health == 0:
		queue_free()
		const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
