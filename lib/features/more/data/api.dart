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
        text: "What are you feeling today?",
        type: "question",
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
      text: body["text"],
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
      type: "question",
      sender: "bot",
      options: const ["Male", "Female", "Other"],
    );

    List<BondChatMessage> messages = [
      userMessage,
      botMessage,
      botQuestionMessage
    ];

    return ListResponse(data: messages);
  }
}
