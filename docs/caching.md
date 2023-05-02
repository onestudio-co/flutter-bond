# Cache

Cache is a flexible and extensible caching library for Flutter applications. It allows you to efficiently manage cache data and customize performance according to your app requirements.

## Documentation

### Cache

The `Cache` class includes all the functions to control cache:

- `get`: To retrieve an item from the cache.
- `has`: To check if an item exists in the cache.
- `put`: To add a new item to the cache.
- `add`: To add a new item to the cache if it doesn't already exist.
- `forever`: To add an item permanently to the cache.
- `forget`: To remove an item from the cache.
- `increment`: To increment the value of an item in the cache.
- `decrement`: To decrement the value of an item in the cache.
- `pull`: To retrieve an item from the cache and remove it.
- `remember`: To store the value of a function in the cache for a specified duration.
- `rememberForever`: To store the value of a function in the cache permanently.
- `store`: To store a specified value for a specified duration.
- `clear`: To clear all cache data.

### CacheDriver

The `CacheDriver` class is an abstract class that defines the required methods for cache drivers:

- `get`
- `has`
- `put`
- `forget`
- `flush`

### Cache Drivers

The package provides two built-in cache drivers:

- `SharedPreferencesCacheDriver`: A cache driver that uses the `SharedPreferences` package for persistent storage.
- `InMemoryCacheDriver`: A cache driver that uses Dart's `Map` for in-memory storage.

## Example

Here's a simple example of how to use the One Studio Core Cache:

```dart
import 'package:one_studio_core/src/cache/cache.dart';

void main() async {
  // Store a value in the cache
  await Cache.put('key', 'value', expiredAfter: Duration(minutes: 10));

  // Retrieve a value from the cache
  String value = await Cache.get<String>('key');
  print(value); // Output: 'value'

  // Remove a value from the cache
  await Cache.forget('key');
}
```

## Caching and Retrieving Custom Objects with Jsonable Mixin

To make it easier for the cache to convert custom objects to JSON and back, you can use the `Jsonable` mixin along with the `json_serializable` package. This approach allows you to generate the `fromJson` and `toJson` methods automatically. Here's how to do it:

1. First, define your custom object class with the `Jsonable` mixin and the necessary JSON annotations:

```dart
import 'package:json_annotation/json_annotation.dart';
import 'package:natural_bond_cache/src/mixins/jsonable.dart';

part 'user.g.dart';

@JsonSerializable()
class User with Jsonable {
  final String id;
  final String name;

  User({required this.id, required this.name});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  
  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
```

Remember to run the `build_runner` command to generate the `*.g.dart` files for your custom objects:

```bash
flutter packages pub run build_runner build
```

2. When caching a custom object, simply pass it as the value to the `put` method:

```dart
final myUser = User(id: '123', name: 'John Doe');
await Cache.put('user_key', myUser);
```

3. When retrieving a custom object, provide the `fromJson` factory method as a parameter to the `get` method:

```dart
final User? myUser = Cache.get<User>('user_key', fromJson: User.fromJson);
```

By using the `Jsonable` mixin and the `json_serializable` package, you can efficiently cache and retrieve custom objects like `User`, `Post`, and others in your application.


## Contributing

Contributions are welcome! If you find a bug, please report it via GitHub issues. If you have a feature request, feel free to open an issue or submit a pull request.
