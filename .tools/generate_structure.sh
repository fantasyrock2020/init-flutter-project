#!/bin/bash

FEATURE_NAME=$1
PAGE_NAME=$2
BASE_LIB="../lib"

if [ -z "$FEATURE_NAME" ] || [ -z "$PAGE_NAME" ]; then
  echo "❌ Usage: ./generate_feature.sh <feature_name> <page_name>"
  echo "   Example: ./generate_feature.sh auth sign_up"
  exit 1
fi

FEATURE_PATH="$BASE_LIB/features/$FEATURE_NAME"
PAGE_PATH="$FEATURE_PATH/$PAGE_NAME"

# Step 1: Create feature if it doesn't exist
if [ ! -d "$FEATURE_PATH" ]; then
  echo "📁 Creating feature: $FEATURE_PATH"
  mkdir -p "$FEATURE_PATH"
  touch "$FEATURE_PATH/$FEATURE_NAME.dart"
fi

# Step 2: Abort if feature already exists
if [ -d "$PAGE_PATH" ]; then
  echo "⚠️ Page '$PAGE_NAME' already exists in feature '$FEATURE_NAME'. Aborting."
  exit 1
fi

# Step 3: Create feature structure
mkdir -p "$PAGE_PATH/bloc"
mkdir -p "$PAGE_PATH/widget"

# Step 4 : Create Bloc
echo "📁 Creating bloc"
# Convert snake_case to PascalCase (e.g., sign_in → SignIn)
to_pascal_case() {
  local input="$1"
  echo "$input" | awk -F'_' '{ for (i=1; i<=NF; i++) { $i=toupper(substr($i,1,1)) tolower(substr($i,2)) } } 1' OFS=''
}

PascalName=$(to_pascal_case "$PAGE_NAME")
cat > "$PAGE_PATH/bloc/${PAGE_NAME}_bloc.dart" <<EOL
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_bloc.dart';

part '${PAGE_NAME}_bloc.freezed.dart';
part '${PAGE_NAME}_event.dart';
part '${PAGE_NAME}_state.dart';

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
cat > "$PAGE_PATH/bloc/${PAGE_NAME}_event.dart" <<EOL
part of '${PAGE_NAME}_bloc.dart';

@freezed
abstract class ${PascalName}Event with _\$${PascalName}Event {
  const factory ${PascalName}Event.started() = _Started;
}
EOL

# State
cat > "$PAGE_PATH/bloc/${PAGE_NAME}_state.dart" <<EOL
part of '${PAGE_NAME}_bloc.dart';

@freezed
abstract class ${PascalName}State with _\$${PascalName}State {
  const factory ${PascalName}State({
    @Default(false) bool success,
  }) = _${PascalName}State;
}
EOL

# Step 5: Create widget and UI files
echo "📁 Creating file"
cat > "$PAGE_PATH/${PAGE_NAME}_page.dart" <<EOL
import 'package:flutter/material.dart';

class ${PascalName}Page extends StatefulWidget {
  const ${PascalName}Page({super.key});

  @override
  State<${PascalName}Page> createState() => _${PascalName}PageState();
}

class _${PascalName}PageState extends State<${PascalName}Page> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
EOL

# Step 6: Add export line if not already in module entry
EXPORT_LINE="export '$PAGE_NAME/${PAGE_NAME}_page.dart';"
FEATURE_ENTRY_FILE="$FEATURE_PATH/$FEATURE_NAME.dart"

append_export() {
  local export_path=$1
  local line="export '$PAGE_NAME/$export_path';"
  if ! grep -Fxq "$line" "$FEATURE_ENTRY_FILE"; then
    echo "$line" >> "$FEATURE_ENTRY_FILE"
    echo "✅ Exported: $line"
  fi
}

append_export "${PAGE_NAME}_page.dart"

# Step 7: Add export for feature in features.dart
FEATURE_FILE="$BASE_LIB/features/features.dart"
FEATURE_EXPORT_LINE="export '$FEATURE_NAME/$FEATURE_NAME.dart';"

# Create page.dart if it doesn't exist
if [ ! -f "$FEATURE_FILE" ]; then
  touch "$FEATURE_FILE"
fi

# Add export if not already present
if ! grep -Fxq "$FEATURE_EXPORT_LINE" "$FEATURE_FILE"; then
  echo "$FEATURE_EXPORT_LINE" >> "$FEATURE_FILE"
  echo "✅ Added export to features.dart"
fi

echo "📁 Generate successfully: $FEATURE_NAME/$PAGE_NAME"
