class_name FoodConfig

enum Nutriment {
	ENERGY,
	FIRE_RESIST,
	FROST_RESIST,
	ACID_RESIST,
	BASE_RESIST,
	SPEED,
	CAC,
	#PROJECTILE,
	#ARMOR,
	#REPRO
}

static var icon_map := {
	Nutriment.ENERGY: null,
	Nutriment.FIRE_RESIST: "fire_resistence.png",
	Nutriment.FROST_RESIST: "ice_resistence.png",
	Nutriment.ACID_RESIST: "acid_resistence.png",
	Nutriment.BASE_RESIST: "base_resistence.png",
	Nutriment.SPEED: "speed.png",
	Nutriment.CAC: "tentacle.png",
}

static var icon_textures = Dicts.map_dict(icon_map, func(path, _i): return load("res://art/textures/food/%s" % path) \
			if path \
			else null)
	
