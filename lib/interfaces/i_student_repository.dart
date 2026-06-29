import '../models/student.dart';

abstract class IStudentRepository {
  List<Student> getAll();
  Student? findById(int id);
  Student add(Student student);
  bool update(Student student);
  bool delete(int id);
  List<Student> search(String keyword);
}
