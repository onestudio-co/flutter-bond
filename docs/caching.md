# Cache

Cache is a flexible and extensible caching library for Flutter applications. It allows you to efficiently manage cache data and customize performance according to your app requirements.

## Documentation


1. [Documentation](#documentation)
   - [Cache](#cache-1)
   - [CacheDriver](#cachedriver)
   - [Cache Drivers](#cache-drivers)
   - [Creating a New Cache Driver](#creating-a-new-cache-driver)
2. [Example](#example)
3. [Caching and Retrieving Custom Objects with Jsonable Mixin](#caching-and-retrieving-custom-objects-with-jsonable-mixin)
4. [Contributing](#contributing)

You can use this index as a table of contents to help readers navigate through the documentation.

### Cache

The `Cache` class includes all the functions to control cache:

- `get`: To retrieve an item from the cache.
```dart
var value = await Cache.get<String>('key');
```

- `has`: To check if an item exists in the cache.
```dart
bool exists = await Cache.has('key');
```

- `put`: To add a new item to the cache.
```dart
await Cache.put('key', 'value', expiredAfter: Duration(minutes: 5));
```

- `add`: To add a new item to the cache if it doesn't already exist.
```dart
await Cache.add('key', 'value', expiredAfter: Duration(minutes: 5));
```

- `forever`: To add an item permanently to the cache.
```dart
await Cache.forever('key', 'value');
```

- `forget`: To remove an item from the cache.
```dart
await Cache.forget('key');
```

- `increment`: To increment the value of an item in the cache.
```dart
await Cache.increment('key');
```

- `decrement`: To decrement the value of an item in the cache.
```dart
await Cache.decrement('key');
```

- `pull`: To retrieve an item from the cache and remove it.
```dart
var value = await Cache.pull('key');
```

- `remember`: To store the value of a function in the cache for a specified duration.
```dart
await Cache.remember('key', Duration(minutes: 5), () async {
  return 'value';
});
```

- `rememberForever`: To store the value of a function in the cache permanently.
```dart
await Cache.rememberForever('key', () async {
  return 'value';
});
```

- `store`: To store a specified value for a specified duration.
```dart
var customCache = Cache.store('custom_cache');
```

- `clear`: To clear all cache data.
```dart
await Cache.clear();
```

These code examples demonstrate how to use each method in the `Cache` class. For each example, you need to replace the 'key' and 'value' with your desired key and value.

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

You can add a section to the README to demonstrate creating a new cache driver. Here's an example:

### Creating a New Cache Driver

To create a new cache driver, follow these steps:

1. Create a new class that implements the `CacheDriver` abstract class.
2. Implement the required methods from the `CacheDriver` class.
3. Add the new cache driver to the `CacheConfig` class.
4. Update the `CacheServiceProvider` to register the new cache driver.

Here's an example of creating a new cache driver called `CustomCacheDriver`:

```dart
import 'package:your_package_name/src/cache/cache.dart';

class CustomCacheDriver extends CacheDriver {
  // Implement the required methods from the CacheDriver class.

  @override
  CacheDriverReturnType<T> get<T>(String key,
      {dynamic defaultValue, FromJsonFactory? factory}) {
    // Your custom implementation here
  }

  @override
  Future<bool> has(String key) {
    // Your custom implementation here
  }

  @override
  Future<bool> put(String key, dynamic value, [Duration? expiredAfter]) {
    // Your custom implementation here
  }

  @override
  Future<bool> forget(String key) {
    // Your custom implementation here
  }

  @override
  Future<bool> flush() {
    // Your custom implementation here
  }
}
```

Now, update the `CacheConfig` class to add the new cache driver:

```dart
class CacheConfig {
  // ...

  static var stores = {
    // ...
    'custom_cache': {
      'driver': 'custom_cache',
      'class': CustomCacheDriver,
    },
  };
}
```

Finally, update the `CacheServiceProvider` to register the new cache driver:

```dart
class CacheServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    // ...

    CacheConfig.stores.forEach((key, value) {
      // ...

      if (value['driver'] == 'custom_cache') {
        it.registerFactory<CacheDriver>(
          CustomCacheDriver.new,
          instanceName: 'custom_cache',
        );
      }
    });
  }
}
```

By following these steps, you can easily create and register new cache drivers to extend the caching functionality of your package.

## Example

Here's a simple example of how to use the One Studio Core Cache:

```dart
import 'package:bond_core/src/cache/cache.dart';

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
