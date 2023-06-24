import 'package:bond_chat_bot/bond_chat_bot.dart';
import 'package:flutter/material.dart';

class BondChatBubbleDecoration extends ChatBubbleDecoration {
  @override
  BoxDecoration get botDecoration => const BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      );

  @override
  BoxDecoration get userDecoration => const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      );

  @override
  EdgeInsets get margin => const EdgeInsets.all(16);

  @override
  EdgeInsets get padding => const EdgeInsets.all(16);

  @override
  TextStyle get botTextStyle => const TextStyle(
        color: Colors.white,
        fontSize: 16,
      );

  @override
  TextStyle get userTextStyle => const TextStyle(
        color: Colors.black,
        fontSize: 16,
      );

  @override
  double get maxWidth => 300;

  @override
  double get minWidth => 100;

  @override
  Duration get botDelayAnimationDuration => const Duration(milliseconds: 0);

  @override
  Duration get userDelayAnimationDuration => const Duration(milliseconds: 0);

  @override
  TextStyle get botTitleTextStyle => const TextStyle(
        color: Colors.white,
        fontSize: 16,
      );
}
