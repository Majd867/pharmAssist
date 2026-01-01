class PharmacistModel {
  final String firstname, lastname, username, phone, password;
  final int salary;
  final bool isAdmin;

  PharmacistModel({
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.phone,
    required this.password,
    required this.salary,
    required this.isAdmin,
  });

  dynamic toJson() {
    return {
      'first_name': firstname,
      'last_name': lastname,
      'username': username,
      'phone': phone,
      'password': password,
      'salary': salary,
      'is_admin': isAdmin,
    };
  }

  factory PharmacistModel.fromJson(data) {
    return PharmacistModel(
      firstname: data['first_name'],
      lastname: data['last_name'],
      username: data['user_name'],
      phone: data['phone'],
      password: data['password'] ?? '',
      salary: data['salary'],
      isAdmin: data['is_admin'] == 1,
    );
  }
}
