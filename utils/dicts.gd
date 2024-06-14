class_name Dicts extends Node


static func map_dict(d: Dictionary, fct: Callable) -> Dictionary:
	var res = {}
	for i in d:
		res[i] = fct.call(d[i], i)
	return res
