import 'package:fixit/core/assets.dart';
import 'package:fixit/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MartialStateSelection extends StatefulWidget {
  final Function(int gender)? onChange;
  final int? initial;

  const MartialStateSelection({
    Key? key,
    this.onChange,
    this.initial,
  }) : super(key: key);

  @override
  MartialStateSelectionState createState() => MartialStateSelectionState();
}

class MartialStateSelectionState extends State<MartialStateSelection> {
  int selectGender = -1;

  @override
  void initState() {
    selectGender = ((widget.initial == null) ? selectGender : widget.initial)!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        right: 16,
        left: 16,
        bottom: 12,
        top: 16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SvgPicture.asset(
            Assets.martial,
            color: Constant.violetColorDark,
            height: 20,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 5, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    Strings.materialLabel,
                    style: const TextStyle(
                      color: Constant.navyColorLight,
                      fontSize: 12,
                      fontFamily: AppFontFamily.regular,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(
                      height: 70,
                      child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 4.2,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(4, (index) {
                          return GestureDetector(
                            onTap: () => onSelect(index),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(
                                    top: (index > 1) ? 0 : 5,
                                    left: 5,
                                  ),
                                  padding: const EdgeInsets.only(
                                    top: 4,
                                    bottom: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected(index)
                                        ? Constant.violetColorDark
                                        : Constant.greyColorRegular,
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  child: Center(
                                    child: Text(
                                      martial[index],
                                      style: TextStyle(
                                        color: isSelected(index)
                                            ? Colors.white
                                            : Constant.navyColorExtraDark,
                                        fontSize: 1.0,
                                        fontFamily: AppFontFamily.medium,
                                      ),
                                    ),
                                  ),
                                  width: 110,
                                ),
                              ],
                            ),
                          );
                        }),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  List<String> get martial => Constant.listNamesMartialState();

  bool isSelected(int index) => index == selectGender;

  onSelect(int index) {
    setState(() {
      if (selectGender == index) {
        selectGender = -1;
      } else {
        selectGender = index;
      }
    });

    widget.onChange?.call(selectGender);
  }
}
