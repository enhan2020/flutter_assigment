class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final id = json["id"] as String?;
    final firstName = json["firstName"] as String?;
    final lastName = json["lastName"] as String?;
    final email = json["email"] as String?;
    final phone = json["phone"] as String?;

    return UserModel(
      id: id ?? '',
      firstName: firstName ?? '',
      lastName: lastName ?? '',
      email: email ?? '',
      phone: phone ?? '',
    );
  }

  toJson() {
    return {"id": id, "firstName": firstName, "lastName": lastName, "email": email, "phone": phone};
  }

  UserModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  @override
  String toString() => toJson().toString();
}
