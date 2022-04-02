# Copyright (c) 2022 Kubulambula
# https://github.com/Kubulambula
# See LICENSE.txt

tool
class_name PolygonShape2D, "res://addons/CollisionPolygonShape/Icons/PolygonShape2D.svg"
extends Resource


func set_polygon(value: PoolVector2Array) -> void:
	pass


func get_polygon() -> PoolVector2Array:
	return PoolVector2Array()


func generate_polygon() -> PoolVector2Array:
	return PoolVector2Array()


func get_area() -> float:
	return 0.0


func get_real_area() -> float:
	return 0.0


static func get_polygon_area(polygon: PoolVector2Array) -> float:
	var area: float = 0
	polygon.append(polygon[0])
	for i in range(polygon.size()-1):
		area += polygon[i].x * polygon[i+1].y
		area -= polygon[i].y * polygon[i+1].x
	return abs(area / 2)
