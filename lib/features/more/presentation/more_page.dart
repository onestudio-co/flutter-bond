import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/chat_provider.dart';

class MorePage extends ConsumerWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatController =
        ref.read(chatStateNotifierProvider.notifier).chatController;
    final chatState = ref.watch(chatStateNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
      ),
      body: ListView.builder(
        itemCount: chatState.messages.length,
        itemBuilder: (context, index) {
          final message = chatState.messages[index];
          // Use your custom message widget here
          return ListTile(title: Text(message.content));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Send a message when the button is pressed
          chatController.sendMessage({"text": "Hello, bot!"});
        },
        child: const Icon(Icons.send),
      ),
    );
  }
}
