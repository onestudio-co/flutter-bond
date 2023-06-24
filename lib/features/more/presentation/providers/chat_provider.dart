import 'package:bond/features/more/data/models/bond_chat_message.dart';
import 'package:bond_chat_bot/bond_chat_bot.dart';
import 'package:bond_core/bond_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatStateNotifier extends StateNotifier<ChatState> {
  final ChatController chatController;

  ChatStateNotifier(this.chatController) : super(ChatState.initial()) {
    chatController.onStateChanged = (newState) {
      state = newState;
    };
  }

  @override
  void dispose() {
    chatController.dispose();
    super.dispose();
  }
}

final chatStateNotifierProvider = StateNotifierProvider.family
    .autoDispose<ChatStateNotifier, ChatState, int>((ref, chatBotId) {
  final chatController =
      sl<ChatController<BondChatMessage, BondChatMeta>>(param1: chatBotId);
  return ChatStateNotifier(chatController);
});
