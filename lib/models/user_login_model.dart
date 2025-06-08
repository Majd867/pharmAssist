class UserLoginModel{
  final String userName;
  final String password;
  final bool isAdmin;

  const UserLoginModel({
    required this.userName,
    required this.password,
    required this.isAdmin
  });
}