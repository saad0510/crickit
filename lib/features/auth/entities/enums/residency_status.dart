enum ResidencyStatus {
  citizen,
  permanentResident,
  temporaryResident,
  workingVisa,
  studentVisa,
  holidayVisa,
  none;

  @override
  String toString() {
    switch (this) {
      case citizen:
        return 'Citizen';
      case permanentResident:
        return 'Permanent Resident';
      case temporaryResident:
        return 'Temporary Resident';
      case workingVisa:
        return 'Working Visa';
      case studentVisa:
        return 'Student Visa';
      case holidayVisa:
        return 'Holiday Visa';
      case none:
        return 'None';
    }
  }

  ResidencyStatus? get value => this == none ? null : this;

  int toMap() => index;

  static ResidencyStatus fromMap(dynamic data) => values[data as int];
}
