# Copyright (c) 2022 Kubulambula
# https://github.com/Kubulambula
# See LICENSE.txt

tool
class_name RectanglePolygonShape2D, "res://addons/CollisionPolygonShape/Icons/RectanglePolygonShape2D.svg"
extends PolygonShape2D


export(Vector2) var extents: Vector2 = Vector2(10, 10) setget set_extents


func set_extents(value: Vector2) -> void:
	extents = value
	emit_changed()


func get_polygon() -> PoolVector2Array:
	var new_polygon: PoolVector2Array = [
			Vector2(-1,-1) * extents,
			Vector2(1,-1) * extents,
			Vector2(1,1) * extents,
			Vector2(-1,1) * extents,
			]
	return new_polygon
