#!/bin/bash

# Input validation
if [ -z "$1" ]; then
  echo "Please provide a model. Example: ./generate_model_entity_mapper.sh district"
  exit 1
fi

FEATURE_NAME=$1

# Convert to PascalCase
to_pascal_case() {
  local input="$1"
  echo "$input" | awk -F'_' '{ for (i=1; i<=NF; i++) { $i=toupper(substr($i,1,1)) tolower(substr($i,2)) } } 1' OFS=''
}

PascalName=$(to_pascal_case "$FEATURE_NAME")

# Create file paths
MODEL_PATH="../data/lib/models/$FEATURE_NAME/${FEATURE_NAME}_model.dart"
MAPPER_PATH="../data/lib/datasource/api/mapper/${FEATURE_NAME}_mapper.dart"
ENTITY_PATH="../domain/lib/entities/$FEATURE_NAME/${FEATURE_NAME}_entity.dart"

# Ensure folders exist
mkdir -p ../data/lib/models/$FEATURE_NAME
mkdir -p ../data/lib/datasource/api/mapper
mkdir -p ../domain/lib/entities/$FEATURE_NAME

# Create model file
cat > "$MODEL_PATH" <<EOL
import 'package:freezed_annotation/freezed_annotation.dart';

part '${FEATURE_NAME}_model.freezed.dart';
part '${FEATURE_NAME}_model.g.dart';

@freezed
abstract class ${PascalName}Model with _\$${PascalName}Model {
  const factory ${PascalName}Model({
    @Default(0) int id,
    @Default('') String name,
  }) = _${PascalName}Model;

  factory ${PascalName}Model.fromJson(Map<String, dynamic> json) =>
      _\$${PascalName}ModelFromJson(json);
}
EOL

# Create entity file
cat > "$ENTITY_PATH" <<EOL
import 'package:freezed_annotation/freezed_annotation.dart';

part '${FEATURE_NAME}_entity.freezed.dart';
part '${FEATURE_NAME}_entity.g.dart';

@freezed
abstract class ${PascalName}Entity with _\$${PascalName}Entity {
  const factory ${PascalName}Entity({
    @Default(0) int id,
    @Default('') String name,
  }) = _${PascalName}Entity;

  factory ${PascalName}Entity.fromJson(Map<String, dynamic> json) =>
      _\$${PascalName}EntityFromJson(json);
}
EOL

# Create mapper file
cat > "$MAPPER_PATH" <<EOL
import 'package:core/data/network/mapper/base_mapper.dart' show BaseDataMapper;
import 'package:domain/entities/$FEATURE_NAME/${FEATURE_NAME}_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../models/$FEATURE_NAME/${FEATURE_NAME}_model.dart';

@lazySingleton
class ${PascalName}Mapper extends BaseDataMapper<${PascalName}Model, ${PascalName}Entity> {
  @override
  ${PascalName}Entity? mapToEntity(${PascalName}Model? data) {
    if (data == null) {
      return null;
    }
    return ${PascalName}Entity.fromJson(data.toJson());
  }

  @override
  ${PascalName}Model mapToModel(${PascalName}Entity entity) {
    return ${PascalName}Model.fromJson(entity.toJson());
  }
}
EOL

# Paths to barrel export files
MODEL_EXPORT_FILE="../data/lib/models/models.dart"
MAPPER_EXPORT_FILE="../data/lib/datasource/api/mapper/mapper.dart"
ENTITY_EXPORT_FILE="../domain/lib/entities/entities.dart"

# Ensure barrel files exist
touch "$MODEL_EXPORT_FILE"
touch "$MAPPER_EXPORT_FILE"
touch "$ENTITY_EXPORT_FILE"

# Export lines
MODEL_EXPORT_LINE="export '$FEATURE_NAME/${FEATURE_NAME}_model.dart';"
ENTITY_EXPORT_LINE="export '$FEATURE_NAME/${FEATURE_NAME}_entity.dart';"
MAPPER_EXPORT_LINE="export '${FEATURE_NAME}_mapper.dart';"

# Append to models.dart if not present
if ! grep -Fxq "$MODEL_EXPORT_LINE" "$MODEL_EXPORT_FILE"; then
  echo -e "$MODEL_EXPORT_LINE" >> "$MODEL_EXPORT_FILE"
  echo "Exported to models.dart"
fi

# Append to entities.dart if not present
if ! grep -Fxq "$ENTITY_EXPORT_LINE" "$ENTITY_EXPORT_FILE"; then
  echo -e "$ENTITY_EXPORT_LINE" >> "$ENTITY_EXPORT_FILE"
  echo "Exported to entities.dart"
fi

# Append to mapper.dart if not present
if ! grep -Fxq "$MAPPER_EXPORT_LINE" "$MAPPER_EXPORT_FILE"; then
  echo -e "$MAPPER_EXPORT_LINE" >> "$MAPPER_EXPORT_FILE"
  echo "Exported to mapper.dart"
fi

# Build runner
echo "Running data model..."
cd .. && cd data && dart run build_runner build --delete-conflicting-outputs

echo "Running domain entity..."
cd .. && cd domain && dart run build_runner build --delete-conflicting-outputs

echo "Generated: $MODEL_PATH"
echo "Generated: $ENTITY_PATH"
echo "Generated: $MAPPER_PATH"
echo "All files generated successfully!"
