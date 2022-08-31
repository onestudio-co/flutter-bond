import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_colors.dart';
import 'package:taleb/core/resources/taleb_string.dart';

class TitleFilterAndClearButton extends StatelessWidget {
  const TitleFilterAndClearButton({
    required this.onPressClear,
    Key? key,
  }) : super(key: key);

  final VoidCallback onPressClear;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 3),
        Center(
          child: Text(TalebStrings.offerFilterTitle,
              style: Theme.of(context).textTheme.bodySmall?.darkJungleGreen),
        ),
        const Spacer(flex: 2),
        TextButton(
          onPressed: onPressClear,
          child: Text(
            TalebStrings.clearButton,
            style: Theme.of(context).textTheme.bodyMedium?.elephant,
          ),
        ),
      ],
    );
  }
}
