# Copyright (c) 2022 Kubulambula
# https://github.com/Kubulambula
# See LICENSE.txt

tool
class_name TrianglePolygonShape2D, "res://addons/CollisionPolygonShape/Icons/TrianglePolygonShape2D.svg"
extends PolygonShape2D


export(float) var side: float = 20 setget set_side
export(PoolVector2Array) var polygon: PoolVector2Array = generate_polygon() setget set_polygon, get_polygon


func set_side(value: float) -> void:
	side = value
	polygon = generate_polygon()
	emit_changed()


func set_polygon(value: PoolVector2Array) -> void:
	polygon = value if value else generate_polygon()
	emit_changed()


func get_polygon() -> PoolVector2Array:
	return polygon


func generate_polygon() -> PoolVector2Array:
	var new_polygon: PoolVector2Array = [
			Vector2(-0.5, 0.28868) * side,
			Vector2(0.5, 0.28868) * side,
			Vector2(0, -0.57735) * side,
			]
	return new_polygon


func get_area() -> float:
	return (side * side * 1.73205) / 4


func get_real_area() -> float:
	return PolygonShape2D.get_polygon_area(get_polygon())
