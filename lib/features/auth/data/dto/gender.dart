enum Gender { male, female, unknown }

class UserGender {
  final int index;
  UserGender(this.index);

  String get text {
    final gender = Gender.values[index];
    switch (gender) {
      case Gender.male:
        return 'male';
      case Gender.female:
        return 'female';
      default:
        return 'unknown';
    }
  }
}
