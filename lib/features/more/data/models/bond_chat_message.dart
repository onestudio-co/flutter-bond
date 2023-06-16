import 'package:bond_core/core.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bond_chat_message.g.dart';

@JsonSerializable(explicitToJson: true)
class BondChatMessage extends Model with ChatMessageConvertible {
  final String text;
  final MessageType type;
  final MessageSender sender;
  final List<String>? options;

  BondChatMessage({
    required int id,
    required this.text,
    required String type,
    required String sender,
    this.options,
  })  : type = BondMessageType.fromString(type),
        sender = BondMessageSender.fromString(sender),
        super(id: id);

  factory BondChatMessage.fromJson(Map<String, dynamic> json) =>
      _$BondChatMessageFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BondChatMessageToJson(this);

  @override
  ChatMessage toChatMessage() {
    return ChatMessage(
      content: text,
      type: type,
      sender: sender,
      choices: options,
    );
  }
}

extension BondMessageType on MessageType {
  static MessageType fromString(String type) {
    switch (type.toLowerCase()) {
      case 'text':
        return MessageType.text;
      case 'question':
        return MessageType.question;
      case 'multi-choice':
        return MessageType.multiChoice;
      default:
        throw ArgumentError('Invalid message type');
    }
  }
}

extension BondMessageSender on MessageSender {
  static MessageSender fromString(String sender) {
    switch (sender.toLowerCase()) {
      case 'user':
        return MessageSender.user;
      case 'bot':
        return MessageSender.bot;
      default:
        throw ArgumentError('Invalid message sender');
    }
  }
}
