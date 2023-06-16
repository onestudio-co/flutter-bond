// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bond_chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BondChatMessage _$BondChatMessageFromJson(Map<String, dynamic> json) =>
    BondChatMessage(
      id: json['id'] as int,
      text: json['text'] as String,
      type: json['type'] as String,
      sender: json['sender'] as String,
      options:
          (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BondChatMessageToJson(BondChatMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'type': _$MessageTypeEnumMap[instance.type]!,
      'sender': _$MessageSenderEnumMap[instance.sender]!,
      'options': instance.options,
    };

const _$MessageTypeEnumMap = {
  MessageType.text: 'text',
  MessageType.question: 'question',
  MessageType.multiChoice: 'multiChoice',
};

const _$MessageSenderEnumMap = {
  MessageSender.user: 'user',
  MessageSender.bot: 'bot',
};
