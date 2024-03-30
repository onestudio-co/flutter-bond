import 'dart:math';

import 'package:faker/faker.dart' show Faker, Internet;

class PostFaker {
  static Map<String, dynamic> posts() {
    return {
      'data': List.generate(10, (index) => post()),
    };
  }

  static Map<String, dynamic> post() {
    final faker = Faker();

    // Constructing thumbnail URL with random parameters
    const imageUrl = 'https://fakeimg.pl/600x400';

    return {
      'uuid': faker.guid.guid(),
      'created_at': faker.date.dateTime().toIso8601String(),
      'updated_at': faker.date.dateTime().toIso8601String(),
      'color': faker.internet.color(),
      'description': faker.lorem.sentence(),
      'urls': {
        'thumb': imageUrl,
        'full': imageUrl,
        'raw': imageUrl,
        'small': imageUrl,
        'regular': imageUrl,
        'small_s3': imageUrl,
      },
      'likes': faker.randomGenerator.integer(1000),
      'author': {
        'uuid': faker.guid.guid(),
        'name': faker.person.name(),
        'username': faker.person.name(),
        'first_name': faker.person.firstName(),
        'last_name': faker.person.lastName(),
        'avatar': faker.internet.httpsUrl(),
        'updated_at': faker.date.dateTime().toIso8601String(),
        'twitter_username': faker.person.name(),
        'bio': faker.lorem.sentence(),
        'total_likes': faker.randomGenerator.integer(1000),
        'total_photos': faker.randomGenerator.integer(1000),
        'instagram_username': faker.person.name(),
      },
      'views': faker.randomGenerator.integer(1000),
      'downloads': faker.randomGenerator.integer(1000),
    };
  }
}

extension XInternet on Internet {
  String color() {
    final random = Random();
    const hexDigits = '0123456789ABCDEF';
    String color = '';
    for (int i = 0; i < 6; i++) {
      color += hexDigits[random.nextInt(16)];
    }
    return color;
  }
}
