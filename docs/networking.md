# BondFire

BondFire is a simple and powerful API client built on top of the Dio package for Dart and Flutter projects. It simplifies making API requests and handling responses by providing a clean and easy-to-use interface.

## Features

 - Easy configuration of API base URL, headers, and other settings
 - Automatically convert response JSON to Dart models
 - Cache support with multiple cache policies
 - Error handling and custom error factory


## Usage

### Configuration
First, configure your API service provider and `Dio` instance. This example uses the [GetIt](https://pub.dev/packages/get_it) package for dependency injection:

```dart
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class ApiServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    final baseOptions = BaseOptions(
      connectTimeout: ApiConfig.connectTimeout,
      sendTimeout: ApiConfig.sendTimeout,
      receiveTimeout: ApiConfig.receiveTimeout,
      receiveDataWhenStatusError: ApiConfig.receiveDataWhenStatusError,
      baseUrl: ApiConfig.baseUrl,
    );

    baseOptions.headers = defaultHeaders();
    final dio = Dio(baseOptions);
    it.registerLazySingleton(() => dio);
  }
}
```

And create an `api.dart` file in your config directory to define your API configuration:

```dart
class ApiConfig {
  static String baseUrl = env('API_BASE_URL');
  static int connectTimeout = env('CONNECT_TIMEOUT');
  static int sendTimeout = env('SEND_TIMEOUT');
  static int receiveTimeout = env('RECEIVE_TIMEOUT');
  static bool receiveDataWhenStatusError =
      env('RECEIVE_DATA_WHEN_STATUS_ERROR');
}
```

### Making API Requests

To make API requests, use the `BondFire` class:

```dart
import 'package:bondfire/bondfire.dart';

final bondFire = BondFire();

// GET request
final userListResponse = await bondFire.get<User>('/users')
  .cache(duration: Duration(minutes: 10), cacheKey: 'user_list')
  .factory(User.fromJson)
  .execute();

// POST request
final createUserResponse = await bondFire.post<User>('/users')
  .body({'name': 'John Doe'})
  .factory(User.fromJson)
  .execute();

// PUT request
final updateUserResponse = await bondFire.put<User>('/users/1')
  .body({'name': 'Jane Doe'})
  .factory(User.fromJson)
  .execute();

// DELETE request
final deleteUserResponse = await bondFire.delete<MessageResponse>('/users/1')
  .factory(MessageResponse.fromJson)
  .execute();
```

### Handling Responses

BondFire provides several built-in response types:

-   `SingleResponse<T>`: A single model object
-   `SingleMResponse<T, M>`: A single model object with metadata
-   `ListResponse<T>`: A list of model objects
-   `ListMResponse<T, M>`: A list of model objects with metadata
-   `MessageResponse`: A response with a message

For example,

to fetch a list of users with metadata, you can use `ListMResponse<User, Metadata>`:

```dart
import 'package:bondfire/bondfire.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  final int id;
  final String name;

  User(this.id, this.name);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Metadata {
  final int totalPages;
  final int currentPage;

  Metadata(this.totalPages, this.currentPage);

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}

final userListMResponse = await bondFire.get<ListMResponse<User, Metadata>>('/users')
  .cache(duration: Duration(minutes: 10), cacheKey: 'user_list')
  .factory(ListMResponse<User, Metadata>.fromJson)
  .errorFactory(MyApiError.fromJson)
  .execute();

print("User list: ${userListMResponse.data}");
print("Metadata: ${userListMResponse.metadata}");
```

### Error Handling

BondFire allows you to define custom error classes that extend the `Error` class in Dart. You can provide an error factory to handle API errors:

```dart
import 'dart:io';

class MyApiError extends Error {
  final String message;
  final int code;

  MyApiError({required this.message, required this.code});

  factory MyApiError.fromJson(Map<String, dynamic> json) {
    return MyApiError(message: json['message'], code: json['code']);
  }
}
```

When an API request encounters an error, BondFire will throw the custom error:

```dart
try {
  final userListMResponse = await bondFire.get<ListMResponse<User, Metadata>>('/users')
    .cache(duration: Duration(minutes: 10), cacheKey: 'user_list')
    .factory(ListMResponse<User, Metadata>.fromJson)
    .errorFactory(ServerError.fromJson)
    .execute();
} on MyApiError catch (error) {
  print('Custom API Error: ${error.message}');
} on SocketException catch (_) {
  print('No internet connection');
} catch (error) {
  print('Unknown error: $error');
}
```


### Caching

BondFire supports caching of API responses with the following cache policies:

-   `CachePolicy.cacheElseNetwork`: Use cache if available, otherwise fetch from API
-   `CachePolicy.cacheThenNetwork`: Use cache, then fetch from API and update cache
-   `CachePolicy.networkElseCache`: Fetch from API, and use cache if API fails
-   `CachePolicy.networkOnly`: Fetch from API and update cache

To cache an API request, use the `cache()` method.
By default, the cache key will be the API path. If you want to provide a custom cache key, pass it as a parameter.

```dart
final userListResponse = await bondFire.get<User>('/users')
  .cache(duration: Duration(minutes: 10),
		 cacheKey: 'user_list',
		 cachePolicy: CachePolicy.cacheElseNetwork)
  .factory(User.fromJson)
  .execute();
```

To use the `CachePolicy.cacheThenNetwork` policy, you can use the `streamExecute()` method:

```dart
final userListStream = bondFire.get<ListResponse<User>>('/users')
  .cache(duration: Duration(minutes: 10),
		 cacheKey: 'user_list',
		 cachePolicy: CachePolicy.cacheThenNetwork)
  .factory(ListResponse<User>.fromJson)
  .streamExecute();

userListStream.listen((userListResponse) {
  print("User list: ${userListResponse.data}");
});
```

### Cache custom keys
FireBond allows you to cache custom keys from the API response. To cache custom keys, pass a map of custom keys to the cacheCustomKeys method:

```dart
  Future<UserApiResult> anonymousLogin() => _bondFire
      .post<UserApiResult>('users/anonymous-login')
      .factory(UserApiResult.fromJson)
      .errorFactory(ServerError.fromJson)
      .cacheCustomKey('token', path: 'meta.token')
      .cacheCustomKey('user', path: 'data')
      .execute();
```
## Conclusion

BondFire makes it easy to manage API requests in your Flutter application with a straightforward and flexible interface. With built-in support for caching, error handling, and serialization, BondFire provides a powerful and convenient way to interact with your RESTful APIs. Implementing BondFire in your project can help streamline your API interactions and improve overall code quality.
