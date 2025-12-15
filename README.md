# Flutter Clean Architecture Project

A Flutter project following Clean Architecture principles and SOLID design patterns, with a modular structure for scalability and maintainability.

## 📋 Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [Features](#features)
- [Getting Started](#getting-started)
- [Renaming the Project](#renaming-the-project)
- [Development Tools](#development-tools)
- [Code Generation](#code-generation)

## 🎯 Overview

This project is built using Flutter and implements Clean Architecture with clear separation of concerns across three main layers:

- **Presentation Layer**: UI components, BLoC/Cubit for state management
- **Domain Layer**: Business logic, Use cases, Repository interfaces
- **Data Layer**: Repository implementations, Data sources, Models

The project uses a modular approach with separate packages for `domain`, `data`, `core`, and `shared` components, making it easy to maintain and scale.

## 🏗️ Architecture

### Clean Architecture Layers

```
┌─────────────────────────────────────┐
│      Presentation Layer             │
│  (Features, BLoC, Widgets)          │
└──────────────┬──────────────────────┘
               │
┌──────────────▼──────────────────────┐
│        Domain Layer                 │
│  (Entities, Use Cases, Repositories)│
└──────────────┬──────────────────────┘
               │
┌──────────────▼──────────────────────┐
│         Data Layer                  │
│  (Models, Data Sources, Repos)      │
└─────────────────────────────────────┘
```

### Key Principles

- **Dependency Rule**: Dependencies point inward (Presentation → Domain ← Data)
- **Separation of Concerns**: Each layer has a single responsibility
- **Testability**: Business logic is independent of frameworks
- **Maintainability**: Changes in one layer don't affect others

## 📁 Project Structure

```
project_structure/
├── lib/                          # Main application code
│   ├── core/                     # Core functionality
│   │   ├── bloc/                 # Base BLoC classes and common BLoCs
│   │   ├── constants/            # App constants
│   │   ├── enums/                # Enumerations
│   │   ├── extensions/           # Extension methods
│   │   ├── routing/              # Navigation configuration
│   │   └── asset_generator/      # Generated assets
│   ├── di/                       # Dependency injection setup
│   ├── features/                 # Feature modules
│   │   └── my_app.dart           # Root app widget
│   └── widget/                   # Shared widgets
│
├── domain/                       # Domain layer (package)
│   └── lib/
│       ├── entities/             # Business entities
│       ├── repositories/         # Repository interfaces
│       └── usecases/             # Business use cases
│
├── data/                         # Data layer (package)
│   └── lib/
│       ├── datasource/           # Data sources
│       │   ├── api/              # Remote API
│       │   └── local/            # Local storage
│       ├── models/               # Data models
│       └── repositories/         # Repository implementations
│
├── packages/                     # Shared packages
│   ├── core/                     # Core utilities
│   └── shared/                   # Shared UI components
│
├── .tools/                       # Development scripts
│   ├── generate_model.sh         # Generate model files
│   ├── generate_repository.sh    # Generate repository files
│   └── generate_structure.sh     # Generate feature structure
│
├── android/                      # Android platform files
├── ios/                          # iOS platform files
├── web/                          # Web platform files
├── macos/                        # macOS platform files
├── linux/                        # Linux platform files
└── windows/                      # Windows platform files
```

## ✨ Features

### Current Features

- **Theme Management**: Light/Dark theme support
- **Internationalization**: Multi-language support
- **Routing**: Navigation with GoRouter

### State Management

- **BLoC Pattern**: Using `flutter_bloc` for state management
- **Base BLoC**: Reusable base classes for common functionality
- **Status Management**: Centralized status handling

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=3.10.0)
- Dart SDK (>=3.10.0)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd project_structure
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Install dependencies for packages**
   ```bash
   cd domain && flutter pub get && cd ..
   cd data && flutter pub get && cd ..
   cd packages/core && flutter pub get && cd ../..
   cd packages/shared && flutter pub get && cd ../..
   ```

4. **Generate code**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

## 🔄 Renaming the Project

To rename this project from `project_structure` to your desired project name, follow these steps:

### Step 1: Rename the Root Directory

```bash
# Navigate to the parent directory
cd ..

# Rename the project directory
mv project_structure your_project_name
cd your_project_name
```

### Step 2: Update pubspec.yaml

Update the `name` field in the root `pubspec.yaml`:

```yaml
name: your_project_name  # Change from 'project_structure'
description: "Your project description"
```

### Step 3: Update Import Statements

Search and replace all import statements that reference `project_structure`:

```bash
# Find all occurrences
grep -r "project_structure" --include="*.dart" .

# Replace in all Dart files (use your preferred method)
# Option 1: Using sed (macOS/Linux)
find . -name "*.dart" -type f -exec sed -i '' 's/project_structure/your_project_name/g' {} +

# Option 2: Using find and replace in your IDE
# Search: project_structure
# Replace: your_project_name
```

### Step 4: Update Android Configuration

**`android/settings.gradle`:**
```gradle
rootProject.name = 'your_project_name'  // Update if needed
```

**`android/app/build.gradle`:**
```gradle
applicationId "com.example.your_project_name"  // Update package name
```

### Step 5: Update iOS Configuration

**`ios/Runner.xcodeproj/project.pbxproj`:**
- Search for `project_structure` and replace with `your_project_name`

**`ios/Runner/Info.plist`:**
- Update `CFBundleName` and `CFBundleDisplayName` if needed

### Step 6: Clean and Rebuild

```bash
# Clean build files
flutter clean

# Get dependencies again
flutter pub get

# Generate code
dart run build_runner build --delete-conflicting-outputs

# Verify the project works
flutter run
```

> **Note**: After renaming, make sure to test the app on all target platforms (Android, iOS, Web, etc.) to ensure everything works correctly.

## 🛠️ Development Tools

### Scripts

Make scripts executable:
```bash
cd .tools && chmod +x generate_model.sh generate_repository.sh generate_structure.sh
```

#### Generate Model
```bash
./generate_model.sh
```

#### Generate Repository
```bash
./generate_repository.sh
```

#### Generate Feature Structure
```bash
./generate_structure.sh
```

## 🔧 Code Generation

Generate all code:
```bash
dart run build_runner build --delete-conflicting-outputs
```

Watch mode (auto-regenerate on changes):
```bash
dart run build_runner watch --delete-conflicting-outputs
```

Generate for specific files:
```bash
dart run build_runner build --build-filter "lib/features/**"
```

---

**Happy Coding! 🚀**
