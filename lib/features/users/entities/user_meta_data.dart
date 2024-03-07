class UserMetaData {
  final String fcm;

  const UserMetaData({
    required this.fcm,
  });

  UserMetaData? useRemainingRequest() {
    return UserMetaData(
      fcm: fcm,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fcm': fcm,
    };
  }

  factory UserMetaData.fromMap(dynamic data) {
    final map = Map<String, dynamic>.from(data);
    final fcm = map['fcm'] ?? '';
    return UserMetaData(fcm: fcm);
  }
}
