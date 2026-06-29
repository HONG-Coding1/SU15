class Student {
  final int id;
  String name;
  String gender;
  int age;
  String email;
  String phone;
  String address;
  String major;

  Student({
    required this.id,
    required this.name,
    required this.gender,
    required this.age,
    required this.email,
    required this.phone,
    required this.address,
    required this.major,
  });

  Student copyWith({
    String? name,
    String? gender,
    int? age,
    String? email,
    String? phone,
    String? address,
    String? major,
  }) {
    return Student(
      id: id,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      major: major ?? this.major,
    );
  }
}
