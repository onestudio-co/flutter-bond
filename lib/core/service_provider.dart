import 'package:get_it/get_it.dart';

abstract class ServiceProvider {
  Future<void> register(GetIt it);
  T? responseConvert<T>(Map<String, dynamic> json) => null;
}
