# Copyright (c) 2022 Kubulambula
# https://github.com/Kubulambula
# See LICENSE.txt

tool
extends CollisionPolygon2D


var shape: PolygonShape2D setget set_shape, get_shape


func _get_property_list() -> Array:
	return [{
		"name": "shape",
		"type": TYPE_OBJECT,
		"hint": PROPERTY_HINT_RESOURCE_TYPE,
		"hint_string": "PolygonShape2D",
		"usage": PROPERTY_USAGE_DEFAULT | PROPERTY_USAGE_SCRIPT_VARIABLE,
		}]


func set_shape(value: PolygonShape2D) -> void:
	if value != shape:
		if value:
			shape.disconnect("changed", self, "update_polygon")
			shape = value
			shape.connect("changed", self, "update_polygon")
			update_polygon()
		else:
			call_deferred("set_polygon", PoolVector2Array())


func get_shape() -> PolygonShape2D:
	return shape


func update_polygon() -> void:
	if shape:
		call_deferred("set_polygon", shape.get_polygon())
