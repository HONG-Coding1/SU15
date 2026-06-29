import '../interfaces/i_student_repository.dart';
import '../models/student.dart';

class StudentRepository implements IStudentRepository {
  final List<Student> _students = [
    Student(
      id: 1,
      name: 'Dara Sok',
      gender: 'Male',
      age: 21,
      email: 'dara.sok@student.edu',
      phone: '0961234567',
      address: 'Phnom Penh',
      major: 'Mobile Application',
    ),
    Student(
      id: 2,
      name: 'Nita Chan',
      gender: 'Female',
      age: 20,
      email: 'nita.chan@student.edu',
      phone: '085778899',
      address: 'Kandal',
      major: 'Software Development',
    ),
  ];

  int _nextId = 3;

  @override
  List<Student> getAll() => List.unmodifiable(_students);

  @override
  Student? findById(int id) {
    try {
      return _students.firstWhere((s) => s.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Student add(Student student) {
    final persisted = Student(
      id: _nextId++,
      name: student.name,
      gender: student.gender,
      age: student.age,
      email: student.email,
      phone: student.phone,
      address: student.address,
      major: student.major,
    );
    _students.add(persisted);
    return persisted;
  }

  @override
  bool update(Student student) {
    final index = _students.indexWhere((s) => s.id == student.id);
    if (index == -1) return false;
    _students[index] = student;
    return true;
  }

  @override
  bool delete(int id) {
    final index = _students.indexWhere((s) => s.id == id);
    if (index == -1) return false;
    _students.removeAt(index);
    return true;
  }

  @override
  List<Student> search(String keyword) {
    final query = keyword.trim().toLowerCase();
    if (query.isEmpty) return getAll();
    return _students.where((s) {
      return s.name.toLowerCase().contains(query) ||
          s.email.toLowerCase().contains(query) ||
          s.phone.toLowerCase().contains(query) ||
          s.address.toLowerCase().contains(query) ||
          s.major.toLowerCase().contains(query);
    }).toList();
  }
}
