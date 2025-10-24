#!/bin/bash

if [ -z "$1" ]; then
  echo "❌ Please provide a feature name. Example: ./generate_repo_api.sh province"
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
DOMAIN_REPO_PATH="lib/domain/repository/${FEATURE_NAME}_repository.dart"
DATA_REPO_PATH="lib/data/repository/${FEATURE_NAME}_repository.dart"
API_INTERFACE_PATH="lib/data/api/${FEATURE_NAME}/${FEATURE_NAME}_api.dart"
API_IMPL_PATH="lib/data/api/${FEATURE_NAME}/${FEATURE_NAME}_api_impl.dart"

mkdir -p lib/domain/repository
mkdir -p lib/data/repository
mkdir -p lib/data/api/${FEATURE_NAME}

# Domain Repository
cat > "$DOMAIN_REPO_PATH" <<EOL
import '../../core/data/network/model/base_response.dart';
import '../domain.dart';

abstract class ${PascalName}Repository {
  Future<List<${PascalName}Entity>> getList${PascalName}();
  Future<List<${PascalName}Entity>> getPaging${PascalName}();
  Future<BaseResponse<${PascalName}Entity>> insert${PascalName}(${PascalName}Entity data);
  Future<BaseResponse<${PascalName}Entity>> update${PascalName}(${PascalName}Entity data);
  Future<BaseResponse<${PascalName}Entity>> delete${PascalName}(${PascalName}Entity data);
  Future<BaseResponse<${PascalName}Entity>> get${PascalName}ByID(int id);
}
EOL

echo "✅ Created: Domain Repository"

# API Interface
cat > "$API_INTERFACE_PATH" <<EOL
import '../../../core/data/network/model/base_response.dart';
import '../../../domain/domain.dart';

abstract class ${PascalName}Api {
  Future<List<${PascalName}Entity>> getList${PascalName}();
  Future<List<${PascalName}Entity>> getPaging${PascalName}();
  Future<BaseResponse<${PascalName}Entity>> insert${PascalName}(${PascalName}Entity data);
  Future<BaseResponse<${PascalName}Entity>> update${PascalName}(${PascalName}Entity data);
  Future<BaseResponse<${PascalName}Entity>> delete${PascalName}(${PascalName}Entity data);
  Future<BaseResponse<${PascalName}Entity>> get${PascalName}ByID(int id);
}
EOL

echo "✅ Created: API Interface"

# API Implementation
cat > "$API_IMPL_PATH" <<EOL
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../core/data/network/dio/auth_dio_client.dart';
import '../../../core/data/network/model/base_response.dart';
import '../../../domain/entity/${FEATURE_NAME}_entity.dart';
import '../../data.dart';
import '../mapper/${FEATURE_NAME}_mapper.dart';
import '${FEATURE_NAME}_api.dart';

@LazySingleton(as: ${PascalName}Api)
class ${PascalName}ApiImpl implements ${PascalName}Api {
  ${PascalName}ApiImpl(this._dioClient, this._${FEATURE_NAME}Mapper);

  final AuthDioClient _dioClient;
  final ${PascalName}Mapper _${FEATURE_NAME}Mapper;

  @override
  Future<BaseResponse<${PascalName}Entity>> delete${PascalName}(${PascalName}Entity data) async {
    try {
      final Response<dynamic> response = await _dioClient.dio.delete(
        '/${FEATURE_NAME}/\${data.id}',
      );

      return BaseResponse<${PascalName}Entity>.fromJson(response.data, (
        Object? json,
      ) {
        final ${PascalName}Model model = ${PascalName}Model.fromJson(
          json! as Map<String, dynamic>,
        );
        return _${FEATURE_NAME}Mapper.mapToEntity(model);
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<${PascalName}Entity>> getList${PascalName}() async {
    try {
      final Response<dynamic> response = await _dioClient.dio.get('/${FEATURE_NAME}s');

      return <${PascalName}Entity>[];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<${PascalName}Entity>> getPaging${PascalName}() async {
    try {
      final Response<dynamic> response = await _dioClient.dio.get('/${FEATURE_NAME}s');

      return <${PascalName}Entity>[];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<${PascalName}Entity>> get${PascalName}ByID(int id) async {
    try {
      final Response<dynamic> response = await _dioClient.dio.get(
        '/${FEATURE_NAME}/\$id',
      );

      return BaseResponse<${PascalName}Entity>.fromJson(response.data, (
        Object? json,
      ) {
        final ${PascalName}Model model = ${PascalName}Model.fromJson(
          json! as Map<String, dynamic>,
        );
        return _${FEATURE_NAME}Mapper.mapToEntity(model);
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<${PascalName}Entity>> insert${PascalName}(${PascalName}Entity data) async {
    try {
      final Response<dynamic> response = await _dioClient.dio.post(
        '/${FEATURE_NAME}',
        data: data.toJson(),
      );

      return BaseResponse<${PascalName}Entity>.fromJson(response.data, (
        Object? json,
      ) {
        final ${PascalName}Model model = ${PascalName}Model.fromJson(
          json! as Map<String, dynamic>,
        );
        return _${FEATURE_NAME}Mapper.mapToEntity(model);
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<${PascalName}Entity>> update${PascalName}(${PascalName}Entity data) async {
    try {
      final Response<dynamic> response = await _dioClient.dio.put(
        '/${FEATURE_NAME}',
        data: data.toJson(),
      );

      return BaseResponse<${PascalName}Entity>.fromJson(response.data, (
        Object? json,
      ) {
        final ${PascalName}Model model = ${PascalName}Model.fromJson(
          json! as Map<String, dynamic>,
        );
        return _${FEATURE_NAME}Mapper.mapToEntity(model);
      });
    } catch (e) {
      rethrow;
    }
  }
}
EOL

echo "✅ Created: API Implementation"

# Repository Implementation
cat > "$DATA_REPO_PATH" <<EOL
import 'package:injectable/injectable.dart';
import '../../core/data/network/model/base_response.dart';
import '../../domain/entity/${FEATURE_NAME}_entity.dart';
import '../../domain/repository/${FEATURE_NAME}_repository.dart';
import '../api/${FEATURE_NAME}/${FEATURE_NAME}_api.dart';

@LazySingleton(as: ${PascalName}Repository)
class ${PascalName}RepositoryImpl implements ${PascalName}Repository {
  ${PascalName}RepositoryImpl(this._${FEATURE_NAME}Api);

  final ${PascalName}Api _${FEATURE_NAME}Api;

  @override
  Future<BaseResponse<${PascalName}Entity>> delete${PascalName}(${PascalName}Entity data) async {
    try {
      return await _${FEATURE_NAME}Api.delete${PascalName}(data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<${PascalName}Entity>> getList${PascalName}() async {
    try {
      return await _${FEATURE_NAME}Api.getList${PascalName}();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<${PascalName}Entity>> getPaging${PascalName}() async {
    try {
      return await _${FEATURE_NAME}Api.getPaging${PascalName}();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<${PascalName}Entity>> get${PascalName}ByID(int id) async {
    try {
      return await _${FEATURE_NAME}Api.get${PascalName}ByID(id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<${PascalName}Entity>> insert${PascalName}(${PascalName}Entity data) async {
    try {
      return await _${FEATURE_NAME}Api.insert${PascalName}(data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<${PascalName}Entity>> update${PascalName}(${PascalName}Entity data) async {
    try {
      return await _${FEATURE_NAME}Api.update${PascalName}(data);
    } catch (e) {
      rethrow;
    }
  }
}
EOL

echo "✅ Created: Repository Implementation"
echo "• $DOMAIN_REPO_PATH"
echo "• $DATA_REPO_PATH"
echo "• $API_INTERFACE_PATH"
echo "• $API_IMPL_PATH"
# End of script
