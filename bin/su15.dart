import 'package:su15/models/student.dart';
import 'package:su15/repositories/student_repository.dart';
import 'package:su15/services/student_service.dart';
import 'package:su15/utils/input_helper.dart';

void main(List<String> arguments) {
  final service = StudentService(StudentRepository());

  while (true) {
    _showMenu();
    final choice = readRequiredText('Choose an option: ');

    switch (choice) {
      case '1':
        _showStudents(service.getAllStudents(), title: 'Student Directory');
        break;
      case '2':
        _addStudent(service);
        break;
      case '3':
        _updateStudent(service);
        break;
      case '4':
        _deleteStudent(service);
        break;
      case '5':
        _searchStudents(service);
        break;
      case '6':
        _showStudents(
          service.sortByName(ascending: true),
          title: 'Directory Sorted A-Z',
        );
        break;
      case '7':
        _showStudents(
          service.sortByName(ascending: false),
          title: 'Directory Sorted Z-A',
        );
        break;
      case '0':
        print('Program closed.');
        return;
      default:
        print('Invalid menu number. Please try again.');
    }
  }
}

void _showMenu() {
  print('\n========== Campus Student Directory ==========');
  print('1. Show student directory');
  print('2. Register new student');
  print('3. Edit student profile');
  print('4. Remove student profile');
  print('5. Find student');
  print('6. Order names A-Z');
  print('7. Order names Z-A');
  print('0. Close program');
}

void _addStudent(StudentService service) {
  print('\n--- Register Student ---');
  final student = service.addStudent(
    name: readRequiredText('Name: '),
    gender: readRequiredText('Gender: '),
    age: readRequiredInt('Age: '),
    email: readRequiredText('Email: '),
    phone: readRequiredText('Phone: '),
    address: readRequiredText('Address: '),
    major: readRequiredText('Major: '),
  );
  print('Saved new student: #${student.id} ${student.name}');
}

void _updateStudent(StudentService service) {
  print('\n--- Edit Student Profile ---');
  final id = readRequiredInt('Student ID: ');
  final existing = service.findById(id);

  if (existing == null) {
    print('No student found with ID $id.');
    return;
  }

  final updated = service.updateStudent(
    id,
    name: readOptionalText('Name', existing.name),
    gender: readOptionalText('Gender', existing.gender),
    age: readOptionalInt('Age', existing.age),
    email: readOptionalText('Email', existing.email),
    phone: readOptionalText('Phone', existing.phone),
    address: readOptionalText('Address', existing.address),
    major: readOptionalText('Major', existing.major),
  );

  if (updated) print('Student profile updated.');
}

void _deleteStudent(StudentService service) {
  print('\n--- Remove Student Profile ---');
  final id = readRequiredInt('Student ID: ');
  if (service.deleteStudent(id)) {
    print('Student profile removed.');
  } else {
    print('No student found with ID $id.');
  }
}

void _searchStudents(StudentService service) {
  print('\n--- Find Student ---');
  final keyword = readRequiredText('Search keyword: ');
  _showStudents(service.searchStudents(keyword), title: 'Search Results');
}

void _showStudents(List<Student> students, {required String title}) {
  print('\n--- $title ---');
  if (students.isEmpty) {
    print('No students found.');
    return;
  }
  for (final student in students) {
    _printStudentProfile(student);
  }
}

void _printStudentProfile(Student student) {
  print('''
[${student.id}] ${student.name}
    Major   : ${student.major}
    Age     : ${student.age}
    Gender  : ${student.gender}
    Contact : ${student.phone} / ${student.email}
    Address : ${student.address}
''');
}
