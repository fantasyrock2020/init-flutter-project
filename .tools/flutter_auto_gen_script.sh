#!/bin/bash

# =================================================
# Flutter Clean Architecture Auto Generator
# Đọc file MD spec và tự động parse để generate code
# =================================================

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Project configuration
SPEC_FILE="${1:-flutter_md_spec.md}"
PROJECT_NAME=""
DEPENDENCIES=()
DEV_DEPENDENCIES=()
BASE_LIB="../lib"

# Functions
print_header() {
    echo -e "${BLUE}================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}================================${NC}"
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

print_info() {
    echo -e "${YELLOW}ℹ $1${NC}"
}

print_parse() {
    echo -e "${CYAN}📖 $1${NC}"
}

# Parse dependencies from MD
parse_dependencies() {
    print_header "Parsing Dependencies from MD Spec"
    
    # Extract production dependencies
    print_info "Extracting production dependencies..."
    
    # Look for flutter pub add command in MD
    local pub_add_line=$(grep -o "flutter pub add [^&]*" "$SPEC_FILE" | head -1)
    
    if [ -n "$pub_add_line" ]; then
        # Extract package names from flutter pub add command
        DEPENDENCIES=($(echo "$pub_add_line" | sed 's/flutter pub add //' | tr ' ' '\n'))
        print_parse "Found ${#DEPENDENCIES[@]} production dependencies"
        for dep in "${DEPENDENCIES[@]}"; do
            echo "  - $dep"
        done
    fi
    
    # Extract dev dependencies
    print_info "Extracting dev dependencies..."
    
    local dev_add_line=$(grep -o "flutter pub add --dev [^&]*" "$SPEC_FILE" | head -1)
    
    if [ -n "$dev_add_line" ]; then
        DEV_DEPENDENCIES=($(echo "$dev_add_line" | sed 's/flutter pub add --dev //' | tr ' ' '\n'))
        print_parse "Found ${#DEV_DEPENDENCIES[@]} dev dependencies"
        for dep in "${DEV_DEPENDENCIES[@]}"; do
            echo "  - $dep"
        done
    else
        print_info "Using fallback dev dependencies..."
        DEV_DEPENDENCIES=(
            "build_runner"
            "injectable_generator"
            "hive_generator"
            "retrofit_generator"
            "flutter_lints"
        )
    fi
}

# Parse folder structure from MD
parse_folder_structure() {
    print_header "Parsing Folder Structure"
    
    local in_code_block=0
    local in_structure=0
    local folders=()
    
    while IFS= read -r line; do
        # Detect code block start/end
        if [[ "$line" =~ ^\`\`\` ]]; then
            if [[ $in_code_block -eq 0 ]]; then
                in_code_block=1
            else
                in_code_block=0
                # If we were parsing structure and code block ended, we're done
                if [[ $in_structure -eq 1 ]]; then
                    break
                fi
            fi
            continue
        fi
        
        # Check if we're in Project Structure section
        if [[ "$line" =~ "Project Structure" ]]; then
            in_structure=1
            continue
        fi
        
        # Parse folder structure inside code block
        if [[ $in_code_block -eq 1 ]] && [[ $in_structure -eq 1 ]]; then
            # Remove tree characters: │ ├ └ ─ and spaces
            local clean_line=$(echo "$line" | sed 's/[│├└─]//g' | sed 's/^[[:space:]]*//')
            
            # Check if it's a folder (ends with /) and starts with lib/ or test/
            if [[ "$clean_line" == *"/"* ]]; then
                local folder="${clean_line%/}"  # Remove trailing /

                # Skip if contains file extensions or injection_container.dart
                if [[ ! "$folder" =~ \. ]] && [[ ! "$folder" =~ "injection_container" ]]; then
                    folders+=("$folder")
                fi
            fi
        fi
    done < "$SPEC_FILE"

    # Remove duplicates and sort
    if [ ${#folders[@]} -gt 0 ]; then
        folders=($(printf '%s\n' "${folders[@]}" | sort -u))
    fi
    
    print_parse "Total folders to create: ${#folders[@]}"
    
    # Export for use in create_folders
    FOLDER_STRUCTURE=("${folders[@]}")
}

# Parse entities from MD
parse_entities() {
    print_header "Parsing Domain Entities"
    
    # Look for entity definitions in MD
    local entities=$(grep -A 10 "^class.*extends Equatable" "$SPEC_FILE" 2>/dev/null || echo "")
    
    if [ -n "$entities" ]; then
        print_parse "Found entity definitions in MD spec"
    else
        print_info "No entities found, will use default structure"
    fi
}

# Create folder structure
create_folders() {
    print_header "Creating Folder Structure"
    
    for folder in "${FOLDER_STRUCTURE[@]}"; do
        # Skip if folder already exists (như lib đã có sẵn)
        if [ -d "$folder" ]; then
            print_info "Skip (exists): $folder"
        else
            mkdir -p "$folder"
            print_success "Created: $folder"
        fi
    done
}

# Install dependencies using parsed data
install_dependencies() {
    print_header "Installing Dependencies (Parsed from MD)"
    
    if [ ${#DEPENDENCIES[@]} -gt 0 ]; then
        print_info "Adding ${#DEPENDENCIES[@]} production dependencies..."
        flutter pub add "${DEPENDENCIES[@]}"
        print_success "Production dependencies added"
    else
        print_error "No dependencies found to install"
    fi
    
    if [ ${#DEV_DEPENDENCIES[@]} -gt 0 ]; then
        print_info "Adding ${#DEV_DEPENDENCIES[@]} dev dependencies..."
        flutter pub add --dev "${DEV_DEPENDENCIES[@]}"
        print_success "Dev dependencies added"
    else
        print_error "No dev dependencies found to install"
    fi
    
    print_success "All dependencies installed with latest versions"
}

# Generate Core files
generate_core_files() {
    print_header "Generating Core Files"
    
    mkdir -p $BASE_LIB/core/error
    mkdir -p $BASE_LIB/core/usecases
    mkdir -p $BASE_LIB/core/constants

    # Failures
    cat > $BASE_LIB/core/error/failures.dart << 'EOF'
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  
  const Failure(this.message);
  
  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(String message) : super(message);
}

class ValidationFailure extends Failure {
  const ValidationFailure(String message) : super(message);
}
EOF
    print_success "Generated failures.dart"
    
    # UseCase base
    cat > $BASE_LIB/core/usecases/usecase.dart << 'EOF'
import 'package:dartz/dartz.dart';
import '../error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
EOF
    print_success "Generated usecase.dart"
    
    # Constants
    cat > $BASE_LIB/core/constants/api_constants.dart << 'EOF'
class ApiConstants {
  static const String baseUrl = 'https://api.openai.com/v1';
  static const String generateEndpoint = '/chat/completions';
  static const int timeoutDuration = 30;
}
EOF
    print_success "Generated api_constants.dart"
}

# Generate Domain Layer
generate_domain_layer() {
    print_header "Generating Domain Layer"
    
    mkdir -p $BASE_LIB/features/markdown_generation/domain/entities
    mkdir -p $BASE_LIB/features/markdown_generation/domain/repositories
    mkdir -p $BASE_LIB/features/markdown_generation/domain/usecases
    
    # MarkdownDocument Entity
    cat > $BASE_LIB/features/markdown_generation/domain/entities/markdown_document.dart << 'EOF'
import 'package:equatable/equatable.dart';

class MarkdownDocument extends Equatable {
  final String id;
  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? templateId;

  const MarkdownDocument({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    this.templateId,
  });

  MarkdownDocument copyWith({
    String? id,
    String? title,
    String? content,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? templateId,
  }) {
    return MarkdownDocument(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      templateId: templateId ?? this.templateId,
    );
  }

  @override
  List<Object?> get props => [id, title, content, createdAt, updatedAt, templateId];
}
EOF
    print_success "Generated markdown_document.dart"
    
    # GenerationRequest Entity
    cat > $BASE_LIB/features/markdown_generation/domain/entities/generation_request.dart << 'EOF'
import 'package:equatable/equatable.dart';

class GenerationRequest extends Equatable {
  final String prompt;
  final int maxTokens;
  final double temperature;
  final String? templateId;
  final String? tone;

  const GenerationRequest({
    required this.prompt,
    this.maxTokens = 2000,
    this.temperature = 0.7,
    this.templateId,
    this.tone,
  });

  @override
  List<Object?> get props => [prompt, maxTokens, temperature, templateId, tone];
}
EOF
    print_success "Generated generation_request.dart"
    
    # Repository Interface
    cat > $BASE_LIB/features/markdown_generation/domain/repositories/markdown_repository.dart << 'EOF'
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/markdown_document.dart';
import '../entities/generation_request.dart';

abstract class MarkdownRepository {
  Future<Either<Failure, String>> generateMarkdown(GenerationRequest request);
  Future<Either<Failure, MarkdownDocument>> saveDocument(MarkdownDocument document);
  Future<Either<Failure, List<MarkdownDocument>>> getDocuments();
  Future<Either<Failure, MarkdownDocument>> getDocumentById(String id);
  Future<Either<Failure, void>> deleteDocument(String id);
  Future<Either<Failure, MarkdownDocument>> updateDocument(MarkdownDocument document);
}
EOF
    print_success "Generated markdown_repository.dart"
    
    # Use Cases
    cat > $BASE_LIB/features/markdown_generation/domain/usecases/generate_markdown.dart << 'EOF'
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/generation_request.dart';
import '../repositories/markdown_repository.dart';

class GenerateMarkdown implements UseCase<String, GenerationRequest> {
  final MarkdownRepository repository;

  GenerateMarkdown(this.repository);

  @override
  Future<Either<Failure, String>> call(GenerationRequest params) async {
    return await repository.generateMarkdown(params);
  }
}
EOF
    print_success "Generated generate_markdown.dart"
    
    cat > $BASE_LIB/features/markdown_generation/domain/usecases/save_document.dart << 'EOF'
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/markdown_document.dart';
import '../repositories/markdown_repository.dart';

class SaveDocument implements UseCase<MarkdownDocument, MarkdownDocument> {
  final MarkdownRepository repository;

  SaveDocument(this.repository);

  @override
  Future<Either<Failure, MarkdownDocument>> call(MarkdownDocument params) async {
    return await repository.saveDocument(params);
  }
}
EOF
    print_success "Generated save_document.dart"
    
    cat > $BASE_LIB/features/markdown_generation/domain/usecases/get_documents.dart << 'EOF'
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/markdown_document.dart';
import '../repositories/markdown_repository.dart';

class GetDocuments implements UseCase<List<MarkdownDocument>, NoParams> {
  final MarkdownRepository repository;

  GetDocuments(this.repository);

  @override
  Future<Either<Failure, List<MarkdownDocument>>> call(NoParams params) async {
    return await repository.getDocuments();
  }
}
EOF
    print_success "Generated get_documents.dart"
}

# Generate BLoC files
generate_bloc_files() {
    print_header "Generating BLoC Files"
    
    mkdir -p $BASE_LIB/features/markdown_generation/presentation/bloc
    
    # Events
    cat > $BASE_LIB/features/markdown_generation/presentation/bloc/markdown_generation_event.dart << 'EOF'
import 'package:equatable/equatable.dart';
import '../../domain/entities/generation_request.dart';
import '../../domain/entities/markdown_document.dart';

abstract class MarkdownGenerationEvent extends Equatable {
  const MarkdownGenerationEvent();

  @override
  List<Object?> get props => [];
}

class GenerateMarkdownEvent extends MarkdownGenerationEvent {
  final GenerationRequest request;

  const GenerateMarkdownEvent(this.request);

  @override
  List<Object?> get props => [request];
}

class SaveDocumentEvent extends MarkdownGenerationEvent {
  final MarkdownDocument document;

  const SaveDocumentEvent(this.document);

  @override
  List<Object?> get props => [document];
}

class LoadDocumentsEvent extends MarkdownGenerationEvent {
  const LoadDocumentsEvent();
}

class DeleteDocumentEvent extends MarkdownGenerationEvent {
  final String id;

  const DeleteDocumentEvent(this.id);

  @override
  List<Object?> get props => [id];
}
EOF
    print_success "Generated markdown_generation_event.dart"
    
    # States
    cat > $BASE_LIB/features/markdown_generation/presentation/bloc/markdown_generation_state.dart << 'EOF'
import 'package:equatable/equatable.dart';
import '../../domain/entities/markdown_document.dart';

abstract class MarkdownGenerationState extends Equatable {
  const MarkdownGenerationState();

  @override
  List<Object?> get props => [];
}

class MarkdownGenerationInitial extends MarkdownGenerationState {}

class MarkdownGenerationLoading extends MarkdownGenerationState {}

class MarkdownGenerationSuccess extends MarkdownGenerationState {
  final String markdown;

  const MarkdownGenerationSuccess(this.markdown);

  @override
  List<Object?> get props => [markdown];
}

class DocumentSaved extends MarkdownGenerationState {
  final MarkdownDocument document;

  const DocumentSaved(this.document);

  @override
  List<Object?> get props => [document];
}

class DocumentsLoaded extends MarkdownGenerationState {
  final List<MarkdownDocument> documents;

  const DocumentsLoaded(this.documents);

  @override
  List<Object?> get props => [documents];
}

class MarkdownGenerationError extends MarkdownGenerationState {
  final String message;

  const MarkdownGenerationError(this.message);

  @override
  List<Object?> get props => [message];
}
EOF
    print_success "Generated markdown_generation_state.dart"
    
    # BLoC
    cat > $BASE_LIB/features/markdown_generation/presentation/bloc/markdown_generation_bloc.dart << 'EOF'
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/generate_markdown.dart';
import '../../domain/usecases/save_document.dart';
import '../../domain/usecases/get_documents.dart';
import '../../../../core/usecases/usecase.dart';
import 'markdown_generation_event.dart';
import 'markdown_generation_state.dart';

class MarkdownGenerationBloc extends Bloc<MarkdownGenerationEvent, MarkdownGenerationState> {
  final GenerateMarkdown generateMarkdown;
  final SaveDocument saveDocument;
  final GetDocuments getDocuments;

  MarkdownGenerationBloc({
    required this.generateMarkdown,
    required this.saveDocument,
    required this.getDocuments,
  }) : super(MarkdownGenerationInitial()) {
    on<GenerateMarkdownEvent>(_onGenerateMarkdown);
    on<SaveDocumentEvent>(_onSaveDocument);
    on<LoadDocumentsEvent>(_onLoadDocuments);
  }

  Future<void> _onGenerateMarkdown(
    GenerateMarkdownEvent event,
    Emitter<MarkdownGenerationState> emit,
  ) async {
    emit(MarkdownGenerationLoading());
    
    final result = await generateMarkdown(event.request);
    
    result.fold(
      (failure) => emit(MarkdownGenerationError(failure.message)),
      (markdown) => emit(MarkdownGenerationSuccess(markdown)),
    );
  }

  Future<void> _onSaveDocument(
    SaveDocumentEvent event,
    Emitter<MarkdownGenerationState> emit,
  ) async {
    emit(MarkdownGenerationLoading());
    
    final result = await saveDocument(event.document);
    
    result.fold(
      (failure) => emit(MarkdownGenerationError(failure.message)),
      (document) => emit(DocumentSaved(document)),
    );
  }

  Future<void> _onLoadDocuments(
    LoadDocumentsEvent event,
    Emitter<MarkdownGenerationState> emit,
  ) async {
    emit(MarkdownGenerationLoading());
    
    final result = await getDocuments(NoParams());
    
    result.fold(
      (failure) => emit(MarkdownGenerationError(failure.message)),
      (documents) => emit(DocumentsLoaded(documents)),
    );
  }
}
EOF
    print_success "Generated markdown_generation_bloc.dart"
}

# Generate main.dart
generate_main() {
    print_header "Generating Main Application"
    
    mkdir -p lib
    
    cat > $BASE_LIB/main.dart << 'EOF'
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Hive
  await Hive.initFlutter();
  
  // Setup dependency injection
  await di.init();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Markdown Generator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('AI Markdown Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.note_add,
              size: 100,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 20),
            const Text(
              'Clean Architecture Setup Complete!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Generated from MD spec automatically',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Dependencies parsed and installed',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to generation page
        },
        tooltip: 'Generate Markdown',
        child: const Icon(Icons.add),
      ),
    );
  }
}
EOF
    print_success "Generated main.dart"
    
    # Dependency Injection
    cat > $BASE_LIB/injection_container.dart << 'EOF'
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // TODO: Register dependencies here
  // Example:
  // sl.registerFactory(() => MarkdownGenerationBloc(
  //   generateMarkdown: sl(),
  //   saveDocument: sl(),
  //   getDocuments: sl(),
  // ));
  
  print('✓ Dependency injection initialized');
}
EOF
    print_success "Generated injection_container.dart"
}

# Generate spec info
generate_spec_info() {
    cat > SPEC_INFO.md << EOF
# Generation Information

## Source Specification
- **File**: $SPEC_FILE
- **Generated**: $(date)

## Parsed Data

### Project Name
$PROJECT_NAME

### Dependencies (${#DEPENDENCIES[@]})
$(printf '%s\n' "${DEPENDENCIES[@]}" | sed 's/^/- /')

### Dev Dependencies (${#DEV_DEPENDENCIES[@]})
$(printf '%s\n' "${DEV_DEPENDENCIES[@]}" | sed 's/^/- /')

### Folders Created (${#FOLDER_STRUCTURE[@]})
$(printf '%s\n' "${FOLDER_STRUCTURE[@]}" | sed 's/^/- /')

## Regeneration

To regenerate this project:
\`\`\`bash
./generate_flutter_from_spec.sh $SPEC_FILE
\`\`\`
EOF
    print_success "Generated SPEC_INFO.md"
}

# Final summary
show_summary() {
    print_header "Generation Complete!"
    
    echo ""
    echo -e "${GREEN}✅ Project generated from MD spec!${NC}"
    echo ""
    echo "📁 Project: $PROJECT_NAME"
    echo "📄 Source: $SPEC_FILE"
    echo ""
    echo "📊 Statistics:"
    echo "   - Dependencies: ${#DEPENDENCIES[@]} production, ${#DEV_DEPENDENCIES[@]} dev"
    echo "   - Folders: ${#FOLDER_STRUCTURE[@]} created"
    echo ""
    echo "🚀 Next steps:"
    echo "   1. cd $PROJECT_NAME"
    echo "   2. flutter run"
    echo ""
    echo "💡 Or open in VSCode:"
    echo "   code $PROJECT_NAME"
    echo ""
    echo "📝 See README.md and SPEC_INFO.md for details"
    echo ""
}

# Main execution
main() {
    print_header "Flutter Clean Architecture Generator"
    echo -e "${CYAN}Reading and parsing MD specification...${NC}"
    echo ""
    
    parse_dependencies
    parse_folder_structure
    parse_entities
    
    echo ""
    print_info "Press ENTER to continue with generation or Ctrl+C to cancel..."
    read -r
    
    create_folders
    # install_dependencies
    # generate_core_files
    # generate_domain_layer
    # generate_bloc_files
    # generate_main
    # generate_spec_info
    
    cd ..
    show_summary
}

# Run main
main