# Copyright (c) 2022 Kubulambula
# https://github.com/Kubulambula
# See LICENSE.txt

tool
extends EditorPlugin


func _enter_tree():
	add_custom_type("CollisionPolygonShape2D", "CollisionPolygon2D", preload("CollisionPolygonShape2D/CollisionPolygonShape2D.gd"), preload("res://addons/CollisionPolygonShape/Icons/CollisionPolygonShape2D.svg"))


func _exit_tree():
	remove_custom_type("CollisionPolygonShape2D")
