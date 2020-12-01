extends Node2D

onready var shadowParent : Viewport
var shadow = MainScript.shadow
onready var shadowInstance = shadow.instance()

var actualPreload = MainScript.actualPreload
onready var actualInstance = actualPreload.instance()


var z : float
var zspd : float

var x : float
var xspd : float

var y : float
var yspd : float


export var grav : float

onready var actual


const floorHeight : int = 0

var canBounce : bool = false


func _ready():

	MainScript.counter += 1
	shadowParent = get_node("/root/Main/ShadowViewport")
	shadowParent.add_child(shadowInstance)
	shadowInstance.set_position(Vector2(x + get_position().x, get_position().y))



	y = get_position().y
	actual = $Actual

	randomize()
	xspd = rand_range(-20,20)
	yspd = rand_range(-20,20)
	zspd = floor(rand_range(-6,-5))

	pass


func _physics_process(delta):

	zspd += grav * delta

	if z + zspd > floorHeight:

		if z == floorHeight:
			get_node("/root/Main/Trash").add_child(actualInstance)
			actualInstance.set_position(Vector2(x + get_position().x, y))
			MainScript.counter -= 1
			queue_free()
			shadowInstance.queue_free()
		elif canBounce:
			xspd = xspd * 0.7 if xspd > 0.1 else 0
			yspd = yspd * 0.7 if yspd > 0.1 else 0
			zspd = zspd * -0.4 if zspd > 0.2 else 0
			z = zspd if zspd > 0.2 else floorHeight
		else:
			zspd = 0
			xspd = 0
			yspd = 0
			z =  floorHeight


	z += zspd
	x += xspd * delta
	y += yspd * delta

	set_position(Vector2(get_position().x,y))
	actual.position.x = x
	actual.position.y = z
	shadowInstance.position.x = x + get_position().x
	shadowInstance.position.y = get_position().y




	pass
