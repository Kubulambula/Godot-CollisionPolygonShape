# Copyright (c) 2022 Kubulambula
# https://github.com/Kubulambula
# See LICENSE.txt

tool
class_name CapsulePolygonShape2D, "res://addons/CollisionPolygonShape/Icons/CapsulePolygonShape2D.svg"
extends PolygonShape2D


export(float) var radius: float = 5 setget set_radius
export(int, 4, 100, 2) var edges: int = 24 setget set_edges
export(float) var height: float = 20 setget set_height


func set_radius(value: float) -> void:
	if value <= height/2:
		radius = value
		emit_changed()
	else:
		printerr("Radius cannot be greater than height/2 (exclusive)")


func set_edges(value: int) -> void:
	edges = value
	emit_changed()


func set_height(value: float) -> void:
	if value >= radius * 2 or value <= 0:
		height = value
		emit_changed()
	else:
		printerr("Height must be between 0 and radius*2 (inclusive)")


func get_polygon() -> PoolVector2Array:
	var new_polygon: PoolVector2Array = []
	for i in range((edges / 2) + 1):
		new_polygon.append(Vector2(cos((2*i*PI)/edges) * radius, ((height - radius * 2) / 2) + sin((2*i*PI)/edges) * radius))
	for i in range((edges / 2), edges + 1):
		new_polygon.append(Vector2(cos((2*i*PI)/edges) * radius, -((height - radius * 2) / 2) + sin((2*i*PI)/edges) * radius))
	return new_polygon
