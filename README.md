# Flutter Clean Architecture Project

A production-ready Flutter starter template following **Clean Architecture** principles and **SOLID** design patterns. Built with a modular multi-package structure for maximum scalability, testability, and maintainability.

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Architecture](#-architecture)
- [Project Structure](#-project-structure)
- [Tech Stack](#-tech-stack)
- [Getting Started](#-getting-started)
- [Code Generation Scripts](#-code-generation-scripts)
- [CI/CD](#-cicd)
- [Renaming the Project](#-renaming-the-project)
- [Contributing](#-contributing)

---

## 🎯 Overview

This project is built using Flutter and implements **Clean Architecture** with clear separation of concerns across three main layers:

| Layer | Responsibility | Location |
|-------|---------------|----------|
| **Presentation** | UI components, BLoC/Cubit state management, Routing | `lib/` |
| **Domain** | Business entities, Use cases, Repository interfaces | `domain/` |
| **Data** | Data models, Data sources (API / Local), Repository implementations | `data/` |

Two additional shared packages provide cross-cutting concerns:

| Package | Purpose | Location |
|---------|---------|----------|
| **Core** | DI, Networking (Dio), BLoC base classes, Extensions, Localization, Logger, Config | `packages/core/` |
| **Shared** | Reusable UI components, Theme system, Images, TextFields | `packages/shared/` |

---

## 🏗️ Architecture

### Clean Architecture Layers

```
┌──────────────────────────────────────────────┐
│           Presentation Layer                 │
│   (Features, BLoC/Cubit, Widgets, Routing)   │
└──────────────────┬───────────────────────────┘
                   │
┌──────────────────▼───────────────────────────┐
│             Domain Layer                     │
│   (Entities, Use Cases, Repository Contracts)│
└──────────────────┬───────────────────────────┘
                   │
┌──────────────────▼───────────────────────────┐
│              Data Layer                      │
│   (Models, Mappers, API/Local Data Sources,  │
│    Repository Implementations)               │
└──────────────────────────────────────────────┘
```

### Dependency Graph

```
┌─────────────────┐     ┌──────────────────┐
│   Presentation  │────▶│     Domain       │◀────┐
│   (lib/)        │     │   (domain/)      │     │
└────────┬────────┘     └──────────────────┘     │
         │                                       │
         │              ┌──────────────────┐     │
         └─────────────▶│      Data        │─────┘
                        │    (data/)       │
                        └──────────────────┘
```

### Key Principles

- **Dependency Rule** — Dependencies point inward: `Presentation → Domain ← Data`
- **Separation of Concerns** — Each layer has a single responsibility
- **Testability** — Business logic is independent of frameworks and UI
- **Maintainability** — Changes in one layer don't ripple across others
- **Modularity** — Each package can be developed and tested in isolation

---

## 📁 Project Structure

```
project_structure/
├── lib/                          # 🎨 Presentation Layer
│   ├── main.dart                 # App entry point
│   ├── constants/                # App-wide constants & strings
│   ├── di/                       # Dependency injection setup
│   ├── enums/                    # Application enumerations
│   ├── features/                 # Feature modules (BLoC per feature)
│   ├── routing/                  # GoRouter navigation
│   └── widget/                   # Shared presentation widgets
│
├── domain/                       # 🏛️ Domain Layer (package)
│   └── lib/
│       ├── entities/             # Business entities (Freezed)
│       ├── repositories/         # Repository contracts (interfaces)
│       └── usecases/             # Business use cases
│
├── data/                         # 💾 Data Layer (package)
│   └── lib/
│       ├── datasource/
│       │   ├── api/              # Remote API clients (Retrofit)
│       │   └── local/            # Local storage data sources
│       ├── di/                   # Data-layer DI module
│       ├── models/               # Data models (Freezed + JSON)
│       └── repositories/         # Repository implementations
│
├── packages/
│   ├── core/                     # ⚙️ Core Utilities Package
│   │   ├── assets/               # Icons & images
│   │   └── lib/
│   │       ├── asset_generator/  # FlutterGen generated assets
│   │       ├── bloc/             # Base BLoC, BlocObserver, Theme & Language cubits
│   │       ├── config/           # Localization & route config
│   │       ├── data/             # Dio client, interceptors, exceptions
│   │       ├── di/               # Injectable (GetIt) configuration
│   │       ├── extensions/       # Context, DateTime, Num, String extensions
│   │       ├── l10n/             # Localization (ARB → Dart)
│   │       └── services/         # Logger service
│   │
│   └── shared/                   # 🎨 Shared UI Package
│
├── .tools/                       # 🔧 Code generation scripts
├── .github/                      # CI/CD workflows & issue templates
│
├── pubspec.yaml                  # Root dependencies
├── analysis_options.yaml         # Lint rules
└── flutter_launcher_icons.yaml   # App icon config
```

---

## 🛠️ Tech Stack

### Core Dependencies

| Category | Package | Purpose |
|----------|---------|---------|
| **State Management** | `flutter_bloc` / `bloc` | BLoC & Cubit pattern |
| **Dependency Injection** | `get_it` + `injectable` | Service locator with code gen |
| **Navigation** | `go_router` | Declarative routing |
| **Networking** | `dio` + `retrofit` | HTTP client + type-safe API |
| **Serialization** | `freezed` + `json_serializable` + `json_annotation` | Immutable models & JSON |
| **Localization** | `flutter_localizations` + `intl` | Multi-language support (ARB) |
| **Storage** | `shared_preferences` + `flutter_secure_storage` | Local data persistence |
| **UI Utilities** | `flutter_svg`, `cached_network_image`, `shimmer` | Image & loading components |
| **Permissions** | `permission_handler` | Runtime permission requests |
| **Connectivity** | `connectivity_plus` | Network status monitoring |
| **Logging** | `logger` | Structured logging |
| **Assets** | `flutter_gen_runner` | Type-safe asset references |
| **Icons** | `flutter_launcher_icons` | App icon generation |
| **UUID** | `uuid` | Unique identifier generation |
| **Storage** | `path_provider` | Platform file paths |

### Dev Dependencies

| Package | Purpose |
|---------|---------|
| `build_runner` | Code generation runner |
| `injectable_generator` | DI code generation |
| `freezed` | Immutable class generation |
| `retrofit_generator` | API client generation |
| `flutter_gen_runner` | Asset code generation |
| `flutter_lints` | Lint rules |

---

## 🚀 Getting Started

### Prerequisites

| Tool | Version |
|------|---------|
| Flutter SDK | `3.41.9` |
| Dart SDK | `>=3.10.0 <4.0.0` |
| Java (Android) | `17` |
| Ruby (Fastlane) | `3.4.7` |

### Installation

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd project_structure
   ```

2. **Install Flutter version (if using FVM)**

   ```bash
   fvm install
   fvm use
   ```

3. **Install all dependencies**

   ```bash
   # Root project
   flutter pub get

   # Sub-packages
   cd domain && flutter pub get && cd ..
   cd data && flutter pub get && cd ..
   cd packages/core && flutter pub get && cd ../..
   cd packages/shared && flutter pub get && cd ../..
   ```

4. **Run code generation**

   ```bash
   # Root project
   dart run build_runner build --delete-conflicting-outputs

   # Domain package
   cd domain && dart run build_runner build --delete-conflicting-outputs && cd ..

   # Data package
   cd data && dart run build_runner build --delete-conflicting-outputs && cd ..

   # Core package
   cd packages/core && dart run build_runner build --delete-conflicting-outputs && cd ../..
   ```

5. **Run the app**

   ```bash
   flutter run
   ```

---

## ⚙️ Code Generation Scripts

Located in `.tools/` — these scripts automate boilerplate generation and follow the project's architecture conventions.

### Make scripts executable

```bash
chmod +x .tools/generate_model.sh .tools/generate_repository.sh .tools/generate_structure.sh
```

### 1. Generate Feature Page

Scaffolds a complete feature page with BLoC, events, state, and widget files.

```bash
cd .tools && ./generate_structure.sh <feature_name> <page_name>
```

**Example:**
```bash
./generate_structure.sh auth sign_in
```

**Creates:**
```
lib/features/auth/
└── sign_in/
    ├── sign_in_page.dart          # StatefulWidget page
    ├── bloc/
    │   ├── sign_in_bloc.dart      # BLoC with BaseBloc
    │   ├── sign_in_event.dart     # Freezed events
    │   └── sign_in_state.dart     # Freezed state
    └── widget/                    # Page-specific widgets
```

Also auto-exports the page in feature barrel files and runs `build_runner`.

### 2. Generate Model + Entity + Mapper

Creates a data model, domain entity, and mapper between them.

```bash
cd .tools && ./generate_model.sh <model_name>
```

**Example:**
```bash
./generate_model.sh district
```

**Creates:**
```
data/lib/models/district/district_model.dart           # Freezed model
domain/lib/entities/district/district_entity.dart       # Freezed entity
data/lib/datasource/api/mapper/district_mapper.dart     # Model ↔ Entity mapper
```

Also auto-exports in barrel files and runs `build_runner` for both `data` and `domain`.

### 3. Generate Repository + API

Creates a domain repository interface, Retrofit API client, and data repository implementation.

```bash
cd .tools && ./generate_repository.sh <feature_name>
```

**Example:**
```bash
./generate_repository.sh province
```

**Creates:**
```
domain/lib/repositories/province_repository.dart             # Abstract repository
data/lib/datasource/api/province/province_api.dart           # Retrofit API client
data/lib/repositories/province_repository_impl.dart          # Repository implementation
```

Includes CRUD operations (`getList`, `getPaging`, `insert`, `update`, `delete`, `getByID`) out of the box.

### 4. Generate Logo

```bash
dart run flutter_launcher_icons
```

---

## 🔧 Build Runner Commands

```bash
# Generate all code
dart run build_runner build --delete-conflicting-outputs

# Watch mode (auto-regenerate on file changes)
dart run build_runner watch --delete-conflicting-outputs

# Generate for a specific directory
dart run build_runner build --build-filter "lib/features/**"
```

---

## 🔄 CI/CD

The project includes a **GitHub Actions** CI pipeline (`.github/workflows/flutter_ci.yml`) that triggers on pushes to `main` and version tags (`v*.*.*`).

### Pipeline Jobs

| Job | Runner | Steps |
|-----|--------|-------|
| **Build Android** | `ubuntu-latest` | Cache → Java 17 → Flutter → `pub get` → Test → Analyze → Fastlane `build_apk` → Upload APK artifact |
| **Build iOS** | `macos-latest` | Cache → Flutter → `pub get` → Test → Analyze → Fastlane `build_ios` → Package IPA → Upload IPA artifact |

### Issue Templates

- 🐛 **Bug Report** — `.github/ISSUE_TEMPLATE/bug_report.md`
- ✨ **Feature Request** — `.github/ISSUE_TEMPLATE/feature_request.md`

---

## 🔄 Renaming the Project

To rename this project from `project_structure` to your desired name:

### Step 1: Rename the root directory

```bash
cd ..
mv project_structure your_project_name
cd your_project_name
```

### Step 2: Update `pubspec.yaml`

```yaml
name: your_project_name
description: "Your project description"
```

### Step 3: Replace all import references

```bash
# Find all occurrences
grep -r "project_structure" --include="*.dart" .

# Replace in all Dart files (macOS/Linux)
find . -name "*.dart" -type f -exec sed -i '' 's/project_structure/your_project_name/g' {} +
```

### Step 4: Update Android configuration

- `android/settings.gradle` → `rootProject.name`
- `android/app/build.gradle` → `applicationId`

### Step 5: Update iOS configuration

- `ios/Runner.xcodeproj/project.pbxproj` → search & replace
- `ios/Runner/Info.plist` → `CFBundleName`, `CFBundleDisplayName`

### Step 6: Update the `core` package reference

In `packages/core/pubspec.yaml`, update the path dependency name:

```yaml
your_project_name:
  path: '../../'
```

### Step 7: Clean & rebuild

```bash
flutter clean
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

> **Note:** Test on all target platforms (Android, iOS, Web, macOS, etc.) after renaming.

---

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Use the provided code generation scripts to maintain architecture consistency
4. Run `flutter analyze` and `flutter test` before committing
5. Submit a Pull Request using the provided issue templates

---

## 📄 License

This project is provided as a starter template. See the [LICENSE](LICENSE) file for details.

---

**Happy Coding! 🚀**
