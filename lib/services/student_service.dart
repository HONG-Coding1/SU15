import '../interfaces/i_student_repository.dart';
import '../models/student.dart';

class StudentService {
  final IStudentRepository _repository;

  StudentService(this._repository);

  List<Student> getAllStudents() => _repository.getAll();

  Student? findById(int id) => _repository.findById(id);

  Student addStudent({
    required String name,
    required String gender,
    required int age,
    required String email,
    required String phone,
    required String address,
    required String major,
  }) {
    final draft = Student(
      id: 0,
      name: name,
      gender: gender,
      age: age,
      email: email,
      phone: phone,
      address: address,
      major: major,
    );
    return _repository.add(draft);
  }

  bool updateStudent(
    int id, {
    required String name,
    required String gender,
    required int age,
    required String email,
    required String phone,
    required String address,
    required String major,
  }) {
    final existing = _repository.findById(id);
    if (existing == null) return false;
    return _repository.update(
      existing.copyWith(
        name: name,
        gender: gender,
        age: age,
        email: email,
        phone: phone,
        address: address,
        major: major,
      ),
    );
  }

  bool deleteStudent(int id) => _repository.delete(id);

  List<Student> searchStudents(String keyword) => _repository.search(keyword);

  List<Student> sortByName({bool ascending = true}) {
    final sorted = List<Student>.from(_repository.getAll());
    sorted.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    return ascending ? sorted : sorted.reversed.toList();
  }
}
