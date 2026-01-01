class UserProfileModel {
  final String firstName, lastName, userName, phoneNumber;

  UserProfileModel({
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.phoneNumber,
  });

  factory UserProfileModel.fromJson(jsonData) {
    return UserProfileModel(
      firstName: jsonData['first_name'] ?? 'No name',
      lastName: jsonData['last_name'] ?? 'No name',
      userName: jsonData['user_name'] ?? 'No name',
      phoneNumber: jsonData['phone'] ?? 'No number',
    );
  }
}
