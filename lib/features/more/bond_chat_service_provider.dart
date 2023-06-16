import 'package:bond/features/more/data/api.dart';
import 'package:bond_core/core.dart';
import 'package:get_it/get_it.dart';

import 'data/models/bond_chat_message.dart';

class BondChatServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    it.registerFactory(() => BondChatApi());
  }

  @override
  T? responseConvert<T>(Map<String, dynamic> json) {
    if (T == ChatMessage) {
      return BondChatMessage.fromJson(json) as T;
    }
    return null;
  }
}
