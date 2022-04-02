# Copyright (c) 2022 Kubulambula
# https://github.com/Kubulambula
# See LICENSE.txt

tool
class_name RectanglePolygonShape2D, "res://addons/CollisionPolygonShape/Icons/RectanglePolygonShape2D.svg"
extends PolygonShape2D


export(Vector2) var extents: Vector2 = Vector2(10, 10) setget set_extents
export(PoolVector2Array) var polygon: PoolVector2Array = generate_polygon() setget set_polygon, get_polygon


func set_extents(value: Vector2) -> void:
	extents = value
	polygon = generate_polygon()
	emit_changed()


func set_polygon(value: PoolVector2Array) -> void:
	polygon = value if value else generate_polygon()
	emit_changed()


func get_polygon() -> PoolVector2Array:
	return polygon


func generate_polygon() -> PoolVector2Array:
	var new_polygon: PoolVector2Array = [
			Vector2(-1,-1) * extents,
			Vector2(1,-1) * extents,
			Vector2(1,1) * extents,
			Vector2(-1,1) * extents,
			]
	return new_polygon


func get_area() -> float:
	return extents.x * extents.y


func get_real_area() -> float:
	return PolygonShape2D.get_polygon_area(get_polygon())
