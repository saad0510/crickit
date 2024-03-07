class Residence {
  final String city;
  final String country;
  final String currentAddress;
  final String permanentAddress;

  const Residence({
    required this.city,
    required this.country,
    required this.currentAddress,
    required this.permanentAddress,
  });

  const Residence.empty()
      : city = '',
        country = '',
        currentAddress = '',
        permanentAddress = '';

  Map<String, dynamic> toMap() {
    return {
      'city': city,
      'country': country,
      'curr_address': currentAddress,
      'perm_address': permanentAddress,
    };
  }

  factory Residence.fromMap(dynamic data) {
    final map = Map<String, dynamic>.from(data);
    return Residence(
      city: map['city'],
      country: map['country'],
      currentAddress: map['curr_address'],
      permanentAddress: map['perm_address'],
    );
  }

  Residence copyWith({
    String? city,
    String? country,
    String? currentAddress,
    String? permanentAddress,
  }) {
    return Residence(
      city: city ?? this.city,
      country: country ?? this.country,
      currentAddress: currentAddress ?? this.currentAddress,
      permanentAddress: permanentAddress ?? this.permanentAddress,
    );
  }
}
