// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bond_chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BondChatMessage _$BondChatMessageFromJson(Map<String, dynamic> json) =>
    BondChatMessage(
      id: json['id'] as int,
      agentId: json['agentId'] as int,
      text: json['text'] as String,
      type: json['type'] as String,
      sender: json['sender'] as String,
      options:
          (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BondChatMessageToJson(BondChatMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'agentId': instance.agentId,
      'text': instance.text,
      'type': _$MessageTypeEnumMap[instance.type]!,
      'sender': _$MessageSenderEnumMap[instance.sender]!,
      'options': instance.options,
    };

const _$MessageTypeEnumMap = {
  MessageType.text: 'text',
  MessageType.question: 'question',
  MessageType.multiChoice: 'multiChoice',
  MessageType.stepper: 'stepper',
  MessageType.ad: 'ad',
};

const _$MessageSenderEnumMap = {
  MessageSender.user: 'user',
  MessageSender.bot: 'bot',
};

BondChatMeta _$BondChatMetaFromJson(Map<String, dynamic> json) => BondChatMeta(
      isVisible: json['visibility_chat_text_field'] as bool? ?? false,
      isActive: json['activate_chat_text_field'] as bool? ?? false,
      id: json['id'] as int? ?? -1,
    );

Map<String, dynamic> _$BondChatMetaToJson(BondChatMeta instance) =>
    <String, dynamic>{
      'id': instance.id,
      'visibility_chat_text_field': instance.isVisible,
      'activate_chat_text_field': instance.isActive,
    };
