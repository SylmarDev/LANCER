extends Area2D

var speed = 400.0
var speedDecay = 1
var sprite
var sprite_width: float
var thingsIHit: Array
var health: int = 4
var damage: float = 1.0



func _ready():
	set_as_top_level(true)
	$AnimatedSprite2D.play("default")

func _physics_process(delta):
	position += (Vector2.RIGHT * speed).rotated(rotation) * delta
	speed = lerp(speed, 200.0, 0.01)

func _on_body_entered(body):
	# always destroy on walls
	if (body.name == "Walls"):
		queue_free()
		return
	
	if (body.get_script() in thingsIHit):
		body.hitBy(self)
		queue_free()
		# call a hurt function on the body

# handle hitting rot
func _on_area_entered(area):
	# print("%s, %s" % [area.name, area.has_method("hitBy")]) # DEBUG
	if (area.has_method("hitBy")):
		area.hitBy(self)
		health -= 1
		if health <= 0:
			queue_free()
