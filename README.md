
# Flutter Countries App

A Flutter application that fetches and displays a list of countries with their details (name, capital, flag, and country code) from a remote API. This project follows a clean architecture pattern with BLoC for state management, dependency injection using `get_it`, and comprehensive unit tests.

## Table of Contents
- [Features](#features)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [Dependencies](#dependencies)
- [Setup and Installation](#setup-and-installation)
- [Running the App](#running-the-app)
- [Running Tests](#running-tests)
- [Contributing](#contributing)
- [License](#license)

## Features
- Fetch a list of countries from a remote API.
- Display country details including name, capital, flag, and code in a scrollable list.
- Handle loading and error states with user-friendly UI feedback.
- Retry functionality for failed API requests.
- Clean architecture with separation of concerns.
- Unit tests for data layer and dependency injection.

## Architecture
This project follows the **Clean Architecture** pattern, ensuring a clear separation of concerns:
- **Presentation Layer**: Manages UI and state using the BLoC pattern (`flutter_bloc`).
- **Domain Layer**: Contains business logic, use cases (e.g., `GetCountries`), and repository interfaces.
- **Data Layer**: Handles data fetching from the remote API, mapping models, and repository implementations.

State management is handled by `CountryBloc`, which processes events (`FetchCountries`) and emits states (`CountryLoading`, `CountryLoaded`, `CountryError`).

Dependency injection is implemented using `get_it` to provide a clean and testable way to manage dependencies.

