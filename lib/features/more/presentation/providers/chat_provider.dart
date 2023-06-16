import 'package:bond/features/more/data/api.dart';
import 'package:bond/features/more/data/models/bond_chat_message.dart';
import 'package:bond_core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatStateNotifier extends StateNotifier<ChatState> {
  final ChatController chatController;

  ChatStateNotifier(this.chatController) : super(ChatState.initial()) {
    chatController.onStateChanged = (newState) {
      state = newState;
    };
  }
}
final chatControllerProvider = Provider<ChatController>((ref) {
  final chatService = sl<BondChatApi>();
  return ChatController(1, chatService);
});

final chatStateNotifierProvider =
StateNotifierProvider<ChatStateNotifier, ChatState>((ref) {
  final chatController = ref.watch(chatControllerProvider);
  return ChatStateNotifier(chatController);
});
