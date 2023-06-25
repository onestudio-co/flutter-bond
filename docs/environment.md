# Managing Environment Variables in Flutter Bond

In any application, managing environment variables is a crucial aspect. In Flutter Bond, we utilize a simple yet efficient approach to manage our environment variables, ensuring the security of our sensitive data.

## Step 1: Create `env.json`

Create an `env.json` file in the root directory of your project. This file is used to store the key-value pairs of your environment variables. The file content should be a valid JSON object.

Here is a sample `env.json`:

```json
{
  "API_BASE_URL": "https://your-api-url.com/",
  "CONNECT_TIMEOUT": 10000,
  "SEND_TIMEOUT": 10000,
  "RECEIVE_TIMEOUT": 10000,
  "RECEIVE_DATA_WHEN_STATUS_ERROR": true
}
```

## Step 2: Add `env.json` to `.gitignore`

Make sure you add the `env.json` file to your `.gitignore` file. It's important to prevent the exposure of your sensitive information to the public.

```bash
echo "env.json" >> .gitignore
```

## Step 3: Load `env.json` as a Run Argument

When running your Flutter application, pass the `env.json` file as an additional argument. Flutter provides a `--dart-define` option that we can use for this.

```bash
flutter run --dart-define-from-file=env.json
```

## Step 4: Define and Access the Environment Variables in Code

In your Dart code, define a map that holds the environment variables. Access these environment variables anywhere in your code using the `String.fromEnvironment`, `int.fromEnvironment`, and `bool.fromEnvironment` methods. Remember to provide the exact key you used in the `env.json` file.

Here's how you can do it:

```dart
const apiConfigs = {
  'API_BASE_URL': String.fromEnvironment('API_BASE_URL'),
  'CONNECT_TIMEOUT': int.fromEnvironment('CONNECT_TIMEOUT', defaultValue: 10000),
  'SEND_TIMEOUT': int.fromEnvironment('SEND_TIMEOUT'),
  'RECEIVE_TIMEOUT': int.fromEnvironment('RECEIVE_TIMEOUT'),
  'RECEIVE_DATA_WHEN_STATUS_ERROR':
      bool.fromEnvironment('RECEIVE_DATA_WHEN_STATUS_ERROR'),
};
```

```dart
import 'api.dart';

final configs = {
  ...apiConfigs,
};

dynamic config(String key) {
  if (!configs.containsKey(key)) {
    throw Exception('Config $key not found');
  }
  return configs[key];
}
```

Then, you can use the `config` function to fetch the values of the environment variables:

```dart
class ApiServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    final baseOptions = BaseOptions(
      connectTimeout: Duration(seconds: config('CONNECT_TIMEOUT')),
      sendTimeout: Duration(seconds: config('SEND_TIMEOUT')),
      receiveTimeout: Duration(seconds: config('RECEIVE_TIMEOUT')),
      receiveDataWhenStatusError: config('RECEIVE_DATA_WHEN_STATUS_ERROR'),
      baseUrl: config('API_BASE_URL'),
    );
  }
}
```

With these steps, you can efficiently manage environment variables in your Flutter Bond applications. Always remember to keep your `env.json` file secure and not expose it publicly to prevent security risks.
