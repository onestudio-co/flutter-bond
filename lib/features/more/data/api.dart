import 'package:bond_chat_bot/bond_chat_bot.dart';
import 'package:bond_network/bond_network.dart';

import 'models/bond_chat_message.dart';

typedef BondChatMessageResult = ListMResponse<BondChatMessage, BondChatMeta>;

class BondChatApi extends ChatDataSource<BondChatMessage, BondChatMeta> {
  @override
  Future<BondChatMessageResult> loadMessages(int chatBotId) async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay

    List<BondChatMessage> messages = [
      BondChatMessage(
        id: 1,
        text: "Hello, How are you?",
        type: "text",
        sender: "bot",
        agentId: chatBotId,
      ),
      BondChatMessage(
        id: 2,
        text:
            "I see, you want to provide more customization options for the TextField's appearance. You can provide properties like style, decoration, cursorColor, textCapitalization, etc., to customize its appearance",
        type: "text",
        sender: "bot",
        agentId: chatBotId,
      ),
    ];

    return ListMResponse(
      messages,
      BondChatMeta(
        isVisible: false,
        isActive: false,
      ),
    );
  }

  @override
  Future<BondChatMessageResult> sendTextMessage(
    int chatBotId,
    String text,
    String? path,
  ) async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay

    BondChatMessage userMessage = BondChatMessage(
      agentId: chatBotId,
      id: 4,
      text: text,
      type: "text",
      sender: "user",
    );

    BondChatMessage botMessage = BondChatMessage(
      agentId: chatBotId,
      id: 5,
      text: "Thank you for your response",
      type: "text",
      sender: "bot",
    );

    BondChatMessage botQuestionMessage = BondChatMessage(
      agentId: chatBotId,
      id: 6,
      text: "What is your gender?",
      type: "multi_choice",
      sender: "bot",
      options: const ["Male", "Female"],
    );

    BondChatMessage botOtherQuestionMessage = BondChatMessage(
      agentId: chatBotId,
      id: 6,
      text: "What is your food?",
      type: "multi_choice",
      sender: "bot",
      options: const ["Cake", "Pizza", "Burger", "Pasta"],
    );

    BondChatMessage botStepperQuestionMessage = BondChatMessage(
      agentId: chatBotId,
      id: 6,
      text: "What is your age?",
      type: "stepper",
      sender: "bot",
    );

    List<BondChatMessage> messages = [
      userMessage,
      botMessage,
      botQuestionMessage,
      botOtherQuestionMessage,
      botStepperQuestionMessage,
    ];

    return ListMResponse(
      messages,
      BondChatMeta(
        isVisible: true,
        isActive: true,
      ),
    );
  }

  @override
  Future<BondChatMessageResult> answerQuestion(
    int chatBotId,
    Map<String, dynamic> body,
    String? path,
  ) async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    List<BondChatMessage> messages = [];
    return ListMResponse(
      messages,
      BondChatMeta(
        isVisible: true,
        isActive: false,
      ),
    );
  }
}
