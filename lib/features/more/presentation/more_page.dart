import 'dart:developer';

import 'package:bond_chat_bot/bond_chat_bot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'messages_views/bond_chat_bubble_decoration.dart';
import 'messages_views/bond_chat_message_builder.dart';
import 'providers/chat_provider.dart';

class MorePage extends ConsumerWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const int chatBotId = 1;
    final chatController =
        ref.read(chatStateNotifierProvider(chatBotId).notifier).chatController;
    final chatState = ref.watch(chatStateNotifierProvider(chatBotId));
    log('chatState: ${chatState.loading}');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
      ),
      body: ChatView(
        controller: chatController,
        state: chatState,
        bubbleBuilder: (context, index, message) {
          return ChatBubble(
            index: index,
            decoration: BondChatBubbleDecoration(),
            message: message,
            chatMessageBuilder: BondChatMessageBuilder(),
          );
        },
        typingIndicator: const ListTile(
          title: Text("Bot is typing..."),
        ),
        inputView: TextField(
          controller: chatController.messageController,
          maxLines: 100,
          minLines: 1,
          decoration: const InputDecoration(
            hintText: "Type a message",
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Send a message when the button is pressed

          chatController.sendTextMessage(
            chatBotId: 1,
          );
        },
        child: const Icon(Icons.send),
      ),
    );
  }
}
