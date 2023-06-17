import 'package:bond_core/core.dart';
import 'package:flutter/material.dart';

import 'multi_choice_message_widget.dart';
import 'stepper_message_widget.dart';

class BondChatMessageBuilder extends ChatMessageBuilder {
  @override
  Widget? build(ChatMessage message) {
    if (message.type == MessageType.multiChoice) {
      return MultiChoiceMessageWidget(message: message);
    } else if (message.type == MessageType.stepper) {
      return StepperMessageWidget(message: message);
    }
    return null;
  }
}
