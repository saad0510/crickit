enum EducationLevel {
  secondary,
  higherSchool,
  bachelor14,
  bachelor16,
  master,
  mphil,
  doctor,
  none;

  @override
  String toString() {
    switch (this) {
      case secondary:
        return 'Matric / O-Levels';
      case higherSchool:
        return 'Intermediate / A-Levels';
      case bachelor14:
        return 'Bachelors (14 years)';
      case bachelor16:
        return 'Bachelors (16 years)';
      case master:
        return 'Masters';
      case mphil:
        return 'M.Phill';
      case doctor:
        return 'Doctor';
      case none:
        return 'None';
    }
  }

  EducationLevel? get value => this == none ? null : this;

  int toMap() => index;

  static EducationLevel fromMap(dynamic data) => values[data as int];
}
