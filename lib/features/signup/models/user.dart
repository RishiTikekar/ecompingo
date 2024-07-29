class User {
  String userName;
  String email;

  User({
    required this.email,
    required this.userName,
  });

  factory User.fromJson(Map<String, String> userData) {
    return User(
      email: userData['email'] ?? '',
      userName: userData['userName'] ?? '',
    );
  }

  static Map<String, String> toJson(User userData) {
    return {
      'email': userData.email,
      'userName': userData.userName,
    };
  }
}
