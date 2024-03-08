import 'education.dart';
import 'enums/gender.dart';
import 'residence.dart';
import 'skills/cricketer_skills.dart';
import 'user_health.dart';

class UserProfile {
  final String bio;
  final Gender gender;
  final UserHealth health;
  final CricketerSkills skills;
  final Residence residence;
  final Education education;

  const UserProfile({
    required this.bio,
    required this.gender,
    required this.health,
    required this.skills,
    required this.residence,
    required this.education,
  });

  factory UserProfile.empty() => _EmptyUserProfile();

  bool get isEmpty => this is _EmptyUserProfile;

  Map<String, dynamic> toMap() {
    return {
      'bio': bio,
      'gender': gender.toMap(),
      'health': health.toMap(),
      'skills': skills.toMap(),
      'residence': residence.toMap(),
      'education': education.toMap(),
    };
  }

  factory UserProfile.fromMap(dynamic data) {
    final map = Map<String, dynamic>.from(data);
    return UserProfile(
      bio: map['bio'],
      gender: Gender.fromMap(map['gender']),
      health: UserHealth.fromMap(map['health']),
      skills: CricketerSkills.fromMap(map['skills']),
      residence: Residence.fromMap(map['residence']),
      education: Education.fromMap(map['education']),
    );
  }

  UserProfile copyWith({
    String? bio,
    Gender? gender,
    UserHealth? health,
    CricketerSkills? skills,
    Residence? residence,
    Education? education,
  }) {
    return UserProfile(
      bio: bio ?? this.bio,
      gender: gender ?? this.gender,
      health: health ?? this.health,
      skills: skills ?? this.skills,
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
          health: const UserHealth.empty(),
          skills: CricketerSkills.empty(),
          residence: const Residence.empty(),
          education: Education.empty(),
        );
}
