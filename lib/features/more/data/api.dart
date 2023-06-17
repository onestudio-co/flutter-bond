import 'package:bond_core/core.dart';

import 'models/bond_chat_message.dart';

class BondChatApi extends ChatDataSource<BondChatMessage> {
  @override
  Future<ListResponse<BondChatMessage>> loadMessages(int chatBotId) async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay

    List<BondChatMessage> messages = [
      BondChatMessage(
        id: 1,
        text: "Hello, How are you?",
        type: "text",
        sender: "bot",
      ),
      BondChatMessage(
        id: 2,
        text:
            "I see, you want to provide more customization options for the TextField's appearance. You can provide properties like style, decoration, cursorColor, textCapitalization, etc., to customize its appearance",
        type: "text",
        sender: "bot",
      ),
    ];

    return ListResponse(data: messages);
  }

  @override
  Future<ListResponse<BondChatMessage>> sendMessage(
    Map<String, dynamic> body,
  ) async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay

    BondChatMessage userMessage = BondChatMessage(
      id: 4,
      text: body["message"],
      type: "text",
      sender: "user",
    );

    BondChatMessage botMessage = BondChatMessage(
      id: 5,
      text: "Thank you for your response",
      type: "text",
      sender: "bot",
    );

    BondChatMessage botQuestionMessage = BondChatMessage(
      id: 6,
      text: "What is your gender?",
      type: "multi_choice",
      sender: "bot",
      options: const ["Male", "Female"],
    );

    BondChatMessage botOtherQuestionMessage = BondChatMessage(
      id: 6,
      text: "What is your food?",
      type: "multi_choice",
      sender: "bot",
      options: const ["Cake", "Pizza", "Burger", "Pasta"],
    );

    BondChatMessage botStepperQuestionMessage = BondChatMessage(
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

    return ListResponse(data: messages);
  }
}
