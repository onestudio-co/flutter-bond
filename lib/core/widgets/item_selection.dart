import 'package:fixit/core/theme/fixit_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class ItemSelection extends StatefulWidget {
  final Function(int index)? onChange;
  final int initial;
  final String icon, label;
  final Color iconColor;
  final List<String> items;

  const ItemSelection({
    Key? key,
    this.onChange,
    this.iconColor = Constant.violetColorDark,
    this.initial = -1,
    required this.icon,
    required this.label,
    required this.items,
  }) : super(key: key);

  @override
  ItemSelectionState createState() => ItemSelectionState();
}

class ItemSelectionState extends State<ItemSelection> {
  int selectItem = -1;

  @override
  void initState() {
    selectItem = widget.initial;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        right: 16,
        left: 16,
        bottom: 12,
        top: 8,
      ),
      child: Row(
        children: <Widget>[
          SvgPicture.asset(
            widget.icon,
            color: widget.iconColor,
            height: 20,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 5, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.label,
                    style: Theme.of(context).textTheme.caption?.regularNavy,
                    textAlign: TextAlign.right,
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    children: List.generate(
                      widget.items.length,
                      (index) => InkWell(
                        onTap: () => onSelect(index),
                        child: Container(
                          margin: const EdgeInsets.only(top: 8, left: 4),
                          padding: const EdgeInsets.only(
                            top: 4,
                            bottom: 4,
                            left: 16,
                            right: 16,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected(index)
                                ? Constant.violetColorDark
                                : Constant.greyColorRegular,
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: Text(widget.items[index],
                              textAlign: TextAlign.center,
                              style: _titleTextTextStyle(context, index)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  bool isSelected(int index) => index == selectItem;

  TextStyle _titleTextTextStyle(BuildContext context, index) {
    if (isSelected(index)) {
      return Theme.of(context).textTheme.button2.white;
    } else {
      return Theme.of(context).textTheme.button2.extraDarkNavy;
    }
  }

  void onSelect(int index) {
    setState(() {
      if (selectItem == index) {
        selectItem = -1;
      } else {
        selectItem = index;
      }
    });

    widget.onChange?.call(selectItem);
  }
}
