import 'dart:io';

String readRequiredText(String prompt) {
  while (true) {
    stdout.write(prompt);
    final input = stdin.readLineSync()?.trim() ?? '';
    if (input.isNotEmpty) return input;
    print('This field is required.');
  }
}

int readRequiredInt(String prompt) {
  while (true) {
    stdout.write(prompt);
    final input = stdin.readLineSync()?.trim() ?? '';
    final value = int.tryParse(input);
    if (value != null) return value;
    print('Please enter a valid number.');
  }
}

String readOptionalText(String label, String currentValue) {
  stdout.write('$label [$currentValue]: ');
  final input = stdin.readLineSync()?.trim() ?? '';
  return input.isEmpty ? currentValue : input;
}

int readOptionalInt(String label, int currentValue) {
  while (true) {
    stdout.write('$label [$currentValue]: ');
    final input = stdin.readLineSync()?.trim() ?? '';
    if (input.isEmpty) return currentValue;
    final value = int.tryParse(input);
    if (value != null) return value;
    print('Please enter a valid number.');
  }
}
