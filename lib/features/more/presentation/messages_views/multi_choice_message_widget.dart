import 'dart:developer';

import 'package:bond/features/more/presentation/providers/chat_provider.dart';
import 'package:bond_chat_bot/bond_chat_bot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MultiChoiceMessageWidget extends ConsumerWidget {
  final ChatMessage message;

  const MultiChoiceMessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    assert(message.type == MessageType.multiChoice);
    assert(message.choices?.isNotEmpty == true);
    assert(message.choices!.length >= 2);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          message.content,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final choice in message.choices!)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                width: MediaQuery.of(context).size.width * 0.2,
                child: ElevatedButton(
                  onPressed: () => _handleAnswer(context, choice, ref),
                  child: Text(choice.text),
                ),
              ),
          ],
        ),
      ],
    );
  }

  void _handleAnswer(BuildContext context, Choice answer, WidgetRef ref) {
    log('User answered: $answer');
    final chatController = ref
        .read(chatStateNotifierProvider(message.chatBotId).notifier)
        .chatController;
    chatController.answerQuestion(
      chatBotId: message.chatBotId,
      body: {'message': 'You answered: ${answer.text}'},
    );
  }
}
