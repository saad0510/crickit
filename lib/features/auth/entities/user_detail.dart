class UserDetail {
  final String name;
  final String email;
  final String phone;
  final String imageUrl;
  final DateTime birthDate;

  const UserDetail({
    required this.name,
    required this.email,
    required this.phone,
    required this.imageUrl,
    required this.birthDate,
  });

  factory UserDetail.empty() => _EmptyUserDetail();

  bool get isEmpty => this is _EmptyUserDetail;

  String get firstName => name.split(' ').first;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'image': imageUrl,
      'dob': birthDate.millisecondsSinceEpoch,
    };
  }

  factory UserDetail.fromMap(dynamic data) {
    final map = Map<String, dynamic>.from(data);
    return UserDetail(
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      imageUrl: map['image'],
      birthDate: DateTime.fromMillisecondsSinceEpoch(map['dob']),
    );
  }

  UserDetail copyWith({
    String? name,
    String? email,
    String? phone,
    String? imageUrl,
    DateTime? birthDate,
  }) {
    return UserDetail(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      imageUrl: imageUrl ?? this.imageUrl,
      birthDate: birthDate ?? this.birthDate,
    );
  }
}

class _EmptyUserDetail extends UserDetail {
  _EmptyUserDetail()
      : super(
          name: '',
          email: '',
          phone: '',
          imageUrl: '',
          birthDate: DateTime(0),
        );
}
