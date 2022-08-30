import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/features/home/widgets/slide_similers/title_widget.dart';

class HeaderSlider extends StatelessWidget {
  final String title;
  final VoidCallback onTapSeeMore;
  final bool isShowMore;

  const HeaderSlider({
    required this.title,
    required this.onTapSeeMore,
    this.isShowMore = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: TalebPadding.p16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SimilerLabelWidget(
            title: title,
          ),
          if (isShowMore)
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              onPressed: onTapSeeMore,
              child: Text(
                TalebStrings.seeMore,
                style: Theme.of(context).textTheme.bodyMedium?.chathamsBlue,
              ),
            ),
        ],
      ),
    );
  }
}
