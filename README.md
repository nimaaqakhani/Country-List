# Flutter Countries App

A Flutter application designed to fetch and display a list of countries with their details (name, capital, flag, and country code) from a remote API. This project leverages modern Flutter practices, including clean architecture, BLoC state management, and dependency injection, to deliver a robust and maintainable codebase.
----------------------------------------------------------------
## Table of Contents
- [Features](#features)
- [Technologies](#technologies)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [Setup and Installation](#setup-and-installation)
- [Running Tests](#running-tests)


----------------------------------------------------------------
## Features
- Fetch country data from a remote API using `Dio`.
- Display country details (name, capital, flag, code) in a scrollable list.
- Optimized image loading and caching with `cached_network_image`.
- Local storage for caching with `path_provider`.
- Comprehensive error handling and loading states with `shimmer` effects.
- Retry mechanism for failed API requests.
- Routing to the main screen using `GoRouter`.
- Unit tests for the data layer.
-----------------------------------------------------------------
## Technologies
- **Networking**: `Dio` for HTTP requests.
- **Data Models**: `freezed` and `json_serializable` for immutable model generation and JSON parsing.
- **State Management**: `flutter_bloc` for reactive state management.
- **Dependency Injection**: `get_it` for managing dependencies.
- **Routing**: `GoRouter` for navigation.
- **Image Optimization**: `cached_network_image` for efficient image loading and caching.
- **Local Storage**: `path_provider` for file system access.
- **Loading Effects**: `shimmer` for animated loading placeholders.
- **Testing**: `flutter_test` and `mockito` for unit tests and mocking.
------------------------------------------------------------------
## Architecture
This project adheres to **Clean Architecture**, ensuring separation of concerns across three layers:
- **Presentation Layer**: Manages UI and state with `CountryBloc` (events: `FetchCountries`, states: `CountryLoading`, `CountryLoaded`, `CountryError`).
- **Domain Layer**: Contains business logic with use cases (e.g., `GetCountries`) and repository interfaces.
- **Data Layer**: Handles API calls, data parsing, and repository implementations.

Dependency injection is powered by `get_it`, providing a clean and testable dependency management system.

----------------------------------------------------------
## Setup and Installation
1. **Prerequisites**:
   - Flutter SDK (version 3.16.2 or later recommended).
   - Dart SDK (version 3.2.0 or later).
   - A code editor (e.g., VS Code or Android Studio).

2. **Clone the Repository**:
   ```bash
   git clone <repository-url>
   cd flutter_application_1

-----------------------------------------------------------
## Run All Tests:
flutter test
