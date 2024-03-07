import 'user_detail.dart';
import 'user_profile.dart';

class UserData {
  final String uid;
  final UserDetail detail;
  final UserProfile profile;

  const UserData({
    required this.uid,
    required this.detail,
    required this.profile,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'detail': detail.toMap(),
      if (!profile.isEmpty) 'profile': profile.toMap(),
    };
  }

  factory UserData.fromMap(dynamic data) {
    final map = Map<String, dynamic>.from(data);
    return UserData(
      uid: map['uid'],
      detail: UserDetail.fromMap(map['detail']),
      profile: map.containsKey('profile') ? UserProfile.fromMap(map['profile']) : UserProfile.empty(),
    );
  }

  UserData copyWith({
    String? uid,
    UserDetail? detail,
    UserProfile? profile,
  }) {
    return UserData(
      uid: uid ?? this.uid,
      detail: detail ?? this.detail,
      profile: profile ?? this.profile,
    );
  }
}
