class_name QodotMeshPerMaterialPipeline
extends QodotBuildPipeline

static func get_build_steps() -> Array:
	return [
		QodotBuildParseMap.new(),

		QodotBuildTextureList.new(),
		QodotBuildMaterials.new(),
		QodotBuildNode.new("worldspawn_node", "Worldspawn", QodotSpatial),
		QodotBuildMaterialMeshes.new(),

		QodotBuildNode.new("static_body", "collision", StaticBody, ['worldspawn_node']),
		QodotBuildStaticConvexCollisionPerBrush.new(),

		QodotBuildNode.new("brush_entities_node", "Brush Entities", QodotSpatial),
		QodotBuildAreaConvexCollision.new(),

		QodotBuildNode.new("point_entities_node", "Point Entities", QodotSpatial),
		QodotBuildPointEntities.new(),

		QodotBuildUnwrapUVs.new(),
	]
