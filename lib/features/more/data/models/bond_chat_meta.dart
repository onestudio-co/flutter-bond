part of 'bond_chat_message.dart';

@JsonSerializable()
class BondChatMeta extends Model with ChatMetaConvertible {
  @JsonKey(name: 'visibility_chat_text_field', defaultValue: false)
  final bool isVisible;

  @JsonKey(name: 'activate_chat_text_field', defaultValue: false)
  final bool isActive;

  BondChatMeta({
    this.isVisible = false,
    this.isActive = false,
    super.id = -1,
  });

  @override
  Map<String, dynamic> toJson() => _$BondChatMetaToJson(this);

  factory BondChatMeta.fromJson(Map<String, dynamic> json) =>
      _$BondChatMetaFromJson(json);

  @override
  List<Object?> get props => [isVisible, isActive];

  @override
  ChatMeta toChatMeta() {
    return ChatMeta(
      isActive: isActive,
      isVisible: isVisible,
    );
  }
}
