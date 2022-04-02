# Copyright (c) 2022 Kubulambula
# https://github.com/Kubulambula
# See LICENSE.txt

tool
class_name CirclePolygonShape2D, "res://addons/CollisionPolygonShape/Icons/CirclePolygonShape2D.svg"
extends PolygonShape2D


export(float, 0, 16384) var radius: float = 10 setget set_radius
export(int, 3, 100) var edges: int = 24 setget set_edges
export(PoolVector2Array) var polygon: PoolVector2Array = generate_polygon() setget set_polygon, get_polygon


func set_radius(value: float) -> void:
	radius = value
	polygon = generate_polygon()
	emit_changed()


func set_edges(value: int) -> void:
	edges = value
	polygon = generate_polygon()
	emit_changed()


func set_polygon(value: PoolVector2Array) -> void:
	polygon = value if value else generate_polygon()
	emit_changed()


func get_polygon() -> PoolVector2Array:
	return polygon


func generate_polygon() -> PoolVector2Array:
	var new_polygon: PoolVector2Array = []
	for i in edges:
		new_polygon.append(Vector2(cos((2*i*PI)/edges) * radius, sin((2*i*PI)/edges) * radius))
	return new_polygon


# Returns area of the circle that is represented
func get_area() -> float:
	return PI * radius * radius


# Returns the real area of the shape (number of edges and radius have a big impact on precision)
func get_real_area() -> float:
	return PolygonShape2D.get_polygon_area(get_polygon())
