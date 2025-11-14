#!/bin/bash

if [ -z "$1" ]; then
  echo "Please provide a feature name. Example: ./generate_repo_api.sh province"
  exit 1
fi

FEATURE_NAME=$1

# Convert to PascalCase
to_pascal_case() {
  local input="$1"
  echo "$input" | awk -F'_' '{ for (i=1; i<=NF; i++) { $i=toupper(substr($i,1,1)) tolower(substr($i,2)) } } 1' OFS=''
}

PascalName=$(to_pascal_case "$FEATURE_NAME")

# Paths
DOMAIN_REPO_PATH="../lib/domain/repositories/${FEATURE_NAME}_repository.dart"
DATA_REPO_PATH="../lib/data/repositories/${FEATURE_NAME}_repository_impl.dart"
API_PATH="../lib/data/datasource/api/${FEATURE_NAME}/${FEATURE_NAME}_api.dart"

mkdir -p ../lib/domain/repositories
mkdir -p ../lib/data/repositories
mkdir -p ../lib/data/datasource/api/${FEATURE_NAME}

# Domain Repository
cat > "$DOMAIN_REPO_PATH" <<EOL
import '../entities/entities.dart';

abstract class ${PascalName}Repository {
  Future<List<${PascalName}Entity>> getList${PascalName}();
  Future<List<${PascalName}Entity>> getPaging${PascalName}();
  Future<${PascalName}Entity?> insert${PascalName}(${PascalName}Entity data);
  Future<${PascalName}Entity?> update${PascalName}(${PascalName}Entity data);
  Future<${PascalName}Entity?> delete${PascalName}(${PascalName}Entity data);
  Future<${PascalName}Entity?> get${PascalName}ByID(int id);
}
EOL

echo "Created: Domain Repository"

# API
cat > "$API_PATH" <<EOL
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/data/network/base/base_response.dart';
import '../../../../domain/entities/entities.dart';
import '../../../models/${FEATURE_NAME}/${FEATURE_NAME}_model.dart';

part '${FEATURE_NAME}_api.g.dart';

@RestApi(baseUrl: 'https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/')
abstract class ${PascalName}Api {
  factory ${PascalName}Api(Dio dio) = _${PascalName}Api;

  @DELETE('/delete')
  Future<BaseResponse<${PascalName}Model>> delete${PascalName}(@Query('id') int id);

  @GET('/${FEATURE_NAME}s')
  Future<BaseResponse<List<${PascalName}Model>>> getList${PascalName}();

  @GET('/${FEATURE_NAME}s')
  Future<BaseResponse<List<${PascalName}Model>>> getPaging${PascalName}();

  @GET('/${FEATURE_NAME}')
  Future<BaseResponse<${PascalName}Model>> get${PascalName}ByID(@Query('id') int id);

  @POST('/insert')
  Future<BaseResponse<${PascalName}Model>> insert${PascalName}(@Body() ${PascalName}Entity data);

  @POST('/update')
  Future<BaseResponse<${PascalName}Model>> update${PascalName}(@Body() ${PascalName}Entity data);
}
EOL

echo "Created: API"

# Repository Implementation
cat > "$DATA_REPO_PATH" <<EOL
import 'package:injectable/injectable.dart';
import '../../core/data/network/base/base_response.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/${FEATURE_NAME}_repository.dart';
import '../datasource/api/mapper/${FEATURE_NAME}_mapper.dart';
import '../datasource/api/${FEATURE_NAME}/${FEATURE_NAME}_api.dart';
import '../models/${FEATURE_NAME}/${FEATURE_NAME}_model.dart';

@LazySingleton(as: ${PascalName}Repository)
class ${PascalName}RepositoryImpl implements ${PascalName}Repository {
  ${PascalName}RepositoryImpl(this._${FEATURE_NAME}Api, this._${FEATURE_NAME}Mapper);

  final ${PascalName}Api _${FEATURE_NAME}Api;
  final ${PascalName}Mapper _${FEATURE_NAME}Mapper;

  @override
  Future<${PascalName}Entity?> delete${PascalName}(${PascalName}Entity data) => _${FEATURE_NAME}Api
      .delete${PascalName}(data.id)
      .then((BaseResponse<${PascalName}Model> res) => _${FEATURE_NAME}Mapper.mapToEntity(res.data));

  @override
  Future<List<${PascalName}Entity>> getList${PascalName}() => _${FEATURE_NAME}Api
      .getList${PascalName}()
      .then((BaseResponse<List<${PascalName}Model>> res) => res.data)
      .then((List<${PascalName}Model>? data) {
        if (data == null) {
          return <${PascalName}Entity>[];
        }
        return data
            .map((${PascalName}Model ${FEATURE_NAME}) => _${FEATURE_NAME}Mapper.mapToEntity(${FEATURE_NAME})!)
            .toList();
      });

  @override
  Future<List<${PascalName}Entity>> getPaging${PascalName}() => _${FEATURE_NAME}Api
      .getPaging${PascalName}()
      .then((BaseResponse<List<${PascalName}Model>> res) => res.data)
      .then((List<${PascalName}Model>? data) {
        if (data == null) {
          return <${PascalName}Entity>[];
        }
        return data
            .map((${PascalName}Model ${FEATURE_NAME}) => _${FEATURE_NAME}Mapper.mapToEntity(${FEATURE_NAME})!)
            .toList();
      });

  @override
  Future<${PascalName}Entity?> get${PascalName}ByID(int id) => _${FEATURE_NAME}Api
      .get${PascalName}ByID(id)
      .then((BaseResponse<${PascalName}Model> res) => _${FEATURE_NAME}Mapper.mapToEntity(res.data));

  @override
  Future<${PascalName}Entity?> insert${PascalName}(${PascalName}Entity data) => _${FEATURE_NAME}Api
      .insert${PascalName}(data)
      .then((BaseResponse<${PascalName}Model> res) => _${FEATURE_NAME}Mapper.mapToEntity(res.data));

  @override
  Future<${PascalName}Entity?> update${PascalName}(${PascalName}Entity data) => _${FEATURE_NAME}Api
      .update${PascalName}(data)
      .then((BaseResponse<${PascalName}Model> res) => _${FEATURE_NAME}Mapper.mapToEntity(res.data));
}
EOL

echo "Created: Repository Implementation"

# Add export line domain/repository
EXPORT_LINE="export '${FEATURE_NAME}_repository.dart';"
FEATURE_ENTRY_FILE="../lib/domain/repositories/repositories.dart"

append_export() {
  local line=$1
  if ! grep -Fxq "$line" "$FEATURE_ENTRY_FILE"; then
    echo "$line" >> "$FEATURE_ENTRY_FILE"
    echo "Exported: $line"
  fi
}
append_export "${EXPORT_LINE}"

# Add export line data/repository
EXPORT_LINE="export '${FEATURE_NAME}_repository_impl.dart';"
FEATURE_ENTRY_FILE="../lib/data/repositories/repositories.dart"

append_export() {
  local line=$1
  if ! grep -Fxq "$line" "$FEATURE_ENTRY_FILE"; then
    echo "$line" >> "$FEATURE_ENTRY_FILE"
    echo "Exported: $line"
  fi
}
append_export "${EXPORT_LINE}"

# Build runner
BASE_FOLDER_BUILD="lib/data/datasource/api/${FEATURE_NAME}"
echo "Running build runner for: ${BASE_FOLDER_BUILD}..."
cd .. && dart run build_runner build --build-filter "${BASE_FOLDER_BUILD}/**"

# End of script
