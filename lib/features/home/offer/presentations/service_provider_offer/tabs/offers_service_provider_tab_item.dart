import 'package:flutter/material.dart';

class OfferServiceProviderTabItem extends Tab {
  final String title;

  const OfferServiceProviderTabItem({required this.title, Key? key})
      : super(key: key, text: title);
}
