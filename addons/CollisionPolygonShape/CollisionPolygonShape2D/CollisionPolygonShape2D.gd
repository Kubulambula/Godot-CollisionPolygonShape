# Copyright (c) 2022 Kubulambula
# https://github.com/Kubulambula
# See LICENSE.txt

tool
extends CollisionPolygon2D


var shape: PolygonShape2D setget set_PolygonShape2D


func _get_property_list() -> Array:
	return [{
			"name": "shape",
			"type": TYPE_OBJECT,
			"hint": PROPERTY_HINT_RESOURCE_TYPE,
			"hint_string": "PolygonShape2D",
			"usage": PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
			}]


func set_PolygonShape2D(value: PolygonShape2D):
	shape = value
	if shape:
		shape.connect("changed", self, "_update_polygon")
		_update_polygon()
	else:
		polygon = PoolVector2Array()


func _update_polygon():
	polygon = shape.get_polygon()
