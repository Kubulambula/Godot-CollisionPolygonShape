# Copyright (c) 2022 Kubulambula
# https://github.com/Kubulambula
# See LICENSE.txt

tool
class_name TrianglePolygonShape2D, "res://addons/CollisionPolygonShape/Icons/TrianglePolygonShape2D.svg"
extends PolygonShape2D


export(float) var side: float = 20 setget set_side


func set_side(value: float) -> void:
	side = value
	emit_changed()


func get_polygon() -> PoolVector2Array:
	var new_polygon: PoolVector2Array = [
			Vector2(-0.5, 0.28868) * side,
			Vector2(0.5, 0.28868) * side,
			Vector2(0, -0.57735) * side,
			]
	return new_polygon
