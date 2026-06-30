# SU15

A Dart command-line application for managing a campus student directory.

## Features

- Show all student profiles
- Register a new student
- Edit an existing student profile
- Remove a student profile
- Search students by name, email, phone, address, or major
- Sort student names from A-Z or Z-A
- Validate required text and number inputs

## Requirements

- Dart SDK 3.12.2 or newer

## Getting Started

Install dependencies:

```sh
dart pub get
```

Run the application:

```sh
dart run bin/su15.dart
```

The program opens an interactive menu:

```text
========== Campus Student Directory ==========
1. Show student directory
2. Register new student
3. Edit student profile
4. Remove student profile
5. Find student
6. Order names A-Z
7. Order names Z-A
0. Close program
```

## Project Structure

```text
bin/
  su15.dart                         Application entry point and menu
lib/
  interfaces/i_student_repository.dart
  models/student.dart               Student data model
  repositories/student_repository.dart
  services/student_service.dart     Student business logic
  utils/input_helper.dart           Console input helpers
```

## Notes

Student records are stored in memory, so changes only last while the program is running. The app starts with two sample students.

## Development

Analyze the project:

```sh
dart analyze
```

Format source files:

```sh
dart format bin lib
```
