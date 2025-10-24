#!/bin/bash

MODULE_NAME=$1
FEATURE_NAME=$2

if [ -z "$MODULE_NAME" ] || [ -z "$FEATURE_NAME" ]; then
  echo "❌ Usage: ./generate_feature.sh <module_name> <feature_name>"
  echo "   Example: ./generate_feature.sh auth sign_up"
  exit 1
fi

MODULE_PATH="lib/modules/$MODULE_NAME"
FEATURE_PATH="$MODULE_PATH/$FEATURE_NAME"

# Step 1: Create module if it doesn't exist
if [ ! -d "$MODULE_PATH" ]; then
  echo "📁 Creating module: $MODULE_NAME"
  mkdir -p "$MODULE_PATH"
  touch "$MODULE_PATH/$MODULE_NAME.dart"
fi

# Step 2: Abort if feature already exists
if [ -d "$FEATURE_PATH" ]; then
  echo "⚠️ Feature '$FEATURE_NAME' already exists in module '$MODULE_NAME'. Aborting."
  exit 1
fi

# Step 3: Create feature structure
mkdir -p "$FEATURE_PATH/bloc"
mkdir -p "$FEATURE_PATH/widget"
mkdir -p "$FEATURE_PATH/ui-platform"

# Step 4 : Create Bloc
echo "📁 Creating bloc"
# Convert snake_case to PascalCase (e.g., sign_in → SignIn)
to_pascal_case() {
  local input="$1"
  echo "$input" | awk -F'_' '{ for (i=1; i<=NF; i++) { $i=toupper(substr($i,1,1)) tolower(substr($i,2)) } } 1' OFS=''
}

PascalName=$(to_pascal_case "$FEATURE_NAME")
cat > "$FEATURE_PATH/bloc/${FEATURE_NAME}_bloc.dart" <<EOL
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base/base_bloc.dart';

part '${FEATURE_NAME}_bloc.freezed.dart';
part '${FEATURE_NAME}_event.dart';
part '${FEATURE_NAME}_state.dart';

@injectable
class ${PascalName}Bloc extends BaseBloc<${PascalName}Event, ${PascalName}State> {
  ${PascalName}Bloc() : super(const ${PascalName}State()) {
    on<_Started>(_onStarted);
  }

  FutureOr<void> _onStarted(_Started event, Emitter<${PascalName}State> emit) {
    // TODO: Initialize state here
  }
}
EOL

# Event
cat > "$FEATURE_PATH/bloc/${FEATURE_NAME}_event.dart" <<EOL
part of '${FEATURE_NAME}_bloc.dart';

@freezed
abstract class ${PascalName}Event with _\$${PascalName}Event {
  const factory ${PascalName}Event.started() = _Started;
}
EOL

# State
cat > "$FEATURE_PATH/bloc/${FEATURE_NAME}_state.dart" <<EOL
part of '${FEATURE_NAME}_bloc.dart';

@freezed
abstract class ${PascalName}State with _\$${PascalName}State {
  const factory ${PascalName}State({
    @Default(false) bool success,
  }) = _${PascalName}State;
}
EOL

# Step 5: Create widget and UI files
echo "📁 Creating file"
touch "$FEATURE_PATH/ui-platform/${FEATURE_NAME}_desktop_page.dart"
touch "$FEATURE_PATH/ui-platform/${FEATURE_NAME}_mobile_page.dart"
touch "$FEATURE_PATH/${FEATURE_NAME}_page.dart"

# Step 6: Add export line if not already in module entry
EXPORT_LINE="export '$FEATURE_NAME/${FEATURE_NAME}_page.dart';"
MODULE_ENTRY_FILE="$MODULE_PATH/$MODULE_NAME.dart"

echo "" >> "$MODULE_ENTRY_FILE"
append_export() {
  local export_path=$1
  local line="export '$FEATURE_NAME/$export_path';"
  if ! grep -Fxq "$line" "$MODULE_ENTRY_FILE"; then
    echo "$line" >> "$MODULE_ENTRY_FILE"
    echo "✅ Exported: $line"
  fi
}

append_export "${FEATURE_NAME}_page.dart"

# Step 7: Add export for module in modules.dart
MODULES_FILE="lib/modules/modules.dart"
MODULE_EXPORT_LINE="export '$MODULE_NAME/$MODULE_NAME.dart';"

# Create modules.dart if it doesn't exist
if [ ! -f "$MODULES_FILE" ]; then
  touch "$MODULES_FILE"
fi

# Add export if not already present
if ! grep -Fxq "$MODULE_EXPORT_LINE" "$MODULES_FILE"; then
  echo "$MODULE_EXPORT_LINE" >> "$MODULES_FILE"
  echo "✅ Added export to modules.dart"
fi

echo "📁 Generate successfully: $MODULE_NAME/$FEATURE_NAME"
