# Flutter Clean Architecture Project

This project follows Clean Architecture principles and SOLID design patterns.

## Use tools

1. cd .tools && chmod +x flutter_auto_gen_script.sh
2. ./flutter_auto_gen_script.sh


## Project Structure

```
lib/
├── core/
│   ├── constants/
│   ├── error/
│   ├── network/
│   ├── usecases/
│   └── utils/
├── features/
│   ├── auth/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   └── home/
│       ├── data/
│       ├── domain/
│       └── presentation/
└── injection_container.dart
```

## Getting Started

1. Install dependencies:
```bash
flutter pub get
```

2. Run the app:
```bash
flutter run
```

## Architecture Overview

This project follows Clean Architecture with three main layers:

- **Presentation**: UI components, BLoC/Cubit for state management
- **Domain**: Business logic, Use cases, Repository interfaces
- **Data**: Repository implementations, Data sources, Models

## Dependencies

- get_it: Dependency injection
- flutter_bloc: State management

## Development

- Follow SOLID principles
- Keep layers independent and maintainable
