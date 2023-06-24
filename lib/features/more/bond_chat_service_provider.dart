import 'package:bond/features/more/data/api.dart';
import 'package:bond_chat_bot/bond_chat_bot.dart';
import 'package:bond_core/bond_core.dart';
import 'package:get_it/get_it.dart';

import 'data/models/bond_chat_message.dart';

class BondChatServiceProvider extends ServiceProvider {
  @override
  Future<void> register(GetIt it) async {
    it.registerFactory(() => BondChatApi());
    it.registerFactoryParam(
      (int agentId, _) => ChatController<BondChatMessage, BondChatMeta>(
        agentId,
        it<BondChatApi>(),
      ),
    );
  }

  @override
  T? responseConvert<T>(Map<String, dynamic> json) {
    if (T == BondChatMessage) {
      return BondChatMessage.fromJson(json) as T;
    } else if (T == BondChatMeta) {
      return BondChatMeta.fromJson(json) as T;
    }
    return null;
  }
}
