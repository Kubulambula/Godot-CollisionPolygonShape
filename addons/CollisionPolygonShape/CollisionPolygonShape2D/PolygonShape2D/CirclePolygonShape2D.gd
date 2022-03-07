# Copyright (c) 2022 Kubulambula
# https://github.com/Kubulambula
# See LICENSE.txt

tool
class_name CirclePolygonShape2D, "res://addons/CollisionPolygonShape/Icons/CirclePolygonShape2D.svg"
extends PolygonShape2D


export(float, 0, 16384) var radius: float = 10 setget set_radius
export(int, 3, 100) var edges: int = 24 setget set_edges


func set_radius(value: float) -> void:
	radius = value
	emit_changed()


func set_edges(value: int) -> void:
	edges = value
	emit_changed()


func get_polygon() -> PoolVector2Array:
	var new_polygon: PoolVector2Array = []
	for i in edges:
		new_polygon.append(Vector2(cos((2*i*PI)/edges) * radius, sin((2*i*PI)/edges) * radius))
	return new_polygon
