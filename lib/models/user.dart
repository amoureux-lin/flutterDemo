class User {
  final String id;
  final String nickname;
  final String? avatar;
  final String? gender; // 可用枚举更佳
  final bool isGuest;

  User({
    required this.id,
    required this.nickname,
    this.avatar,
    this.gender,
    this.isGuest = true,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      nickname: json['nickname'] ?? '',
      avatar: json['avatar'],
      gender: json['gender'],
      isGuest: json['is_guest'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nickname': nickname,
      'avatar': avatar,
      'gender': gender,
      'is_guest': isGuest,
    };
  }
}
