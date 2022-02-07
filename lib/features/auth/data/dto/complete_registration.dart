import 'gender.dart';

class CompleteRegistration {
  final String countryId;
  final String countryName;
  final String dob;
  final String name;
  final String referralCode;
  final String? city;
  final int gender;
  final String martial;
  final String cityName;

  CompleteRegistration(
      {required this.countryId,
      required this.countryName,
      required this.dob,
      required this.name,
      required this.referralCode,
      this.city,
      required this.gender,
      required this.martial,
      required this.cityName});

  Map<String, dynamic> get body => {
        "name": name,
        "referral_code": referralCode,
        "country_id": countryId,
        "dob": dob,
        "city_id": city,
        "gender": UserGender(gender).text,
        "martial_status": martial,
        "referral_link": ''
      };
}
