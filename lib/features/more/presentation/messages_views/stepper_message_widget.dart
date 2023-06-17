import 'package:bond/features/more/presentation/providers/chat_provider.dart';
import 'package:bond_core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StepperMessageWidget extends ConsumerStatefulWidget {
  final ChatMessage message;

  const StepperMessageWidget({super.key, required this.message});

  @override
  ConsumerState<StepperMessageWidget> createState() =>
      _StepperMessageWidgetState();
}

class _StepperMessageWidgetState extends ConsumerState<StepperMessageWidget> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    assert(widget.message.type == MessageType.stepper);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.message.content,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed:
                  currentStep > 0 ? () => setState(() => currentStep--) : null,
            ),
            Text(
              "$currentStep",
              style: const TextStyle(fontSize: 24),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => setState(() => currentStep++),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () => _handleAnswer(context, currentStep),
          child: const Text('Select'),
        ),
      ],
    );
  }

  void _handleAnswer(BuildContext context, int currentStep) {
    final chatController =
        ref.read(chatStateNotifierProvider.notifier).chatController;
    chatController.sendMessage(
      body: {'message': 'You selected: $currentStep'},
    );
  }
}
