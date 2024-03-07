import 'education.dart';
import 'enums/gender.dart';
import 'residence.dart';

class UserProfile {
  final String bio;
  final Gender gender;
  final double height;
  final double weight;
  final bool smoking;
  final Residence residence;
  final Education education;

  const UserProfile({
    required this.bio,
    required this.gender,
    required this.height,
    required this.weight,
    required this.smoking,
    required this.residence,
    required this.education,
  });

  factory UserProfile.empty() => _EmptyUserProfile();

  bool get isEmpty => this is _EmptyUserProfile;

  Map<String, dynamic> toMap() {
    return {
      'bio': bio,
      'gender': gender.toMap(),
      'height': height,
      'weight': weight,
      'smoking': smoking,
      'residence': residence.toMap(),
      'education': education.toMap(),
    };
  }

  factory UserProfile.fromMap(dynamic data) {
    final map = Map<String, dynamic>.from(data);
    return UserProfile(
      bio: map['bio'],
      gender: Gender.fromMap(map['gender']),
      height: (map['height'] as num).toDouble(),
      weight: (map['weight'] as num).toDouble(),
      smoking: map['smoking'],
      residence: Residence.fromMap(map['residence']),
      education: Education.fromMap(map['education']),
    );
  }

  UserProfile copyWith({
    String? bio,
    Gender? gender,
    double? height,
    double? weight,
    bool? smoking,
    Residence? residence,
    Education? education,
  }) {
    return UserProfile(
      bio: bio ?? this.bio,
      gender: gender ?? this.gender,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      smoking: smoking ?? this.smoking,
      residence: residence ?? this.residence,
      education: education ?? this.education,
    );
  }
}

class _EmptyUserProfile extends UserProfile {
  _EmptyUserProfile()
      : super(
          bio: '',
          gender: Gender.male,
          height: -1,
          weight: -1,
          smoking: false,
          residence: Residence.empty(),
          education: Education.empty(),
        );
}
