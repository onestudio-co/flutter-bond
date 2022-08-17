import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/taleb_image.dart';
import 'package:taleb/features/home/news/data/models/news.dart';
import 'package:taleb/features/home/widgets/additional_info_row_with_city.dart';
import 'package:taleb/main.dart';

class SimilerStackWidget extends StatelessWidget {
  const SimilerStackWidget({
    this.news,
    Key? key,
  }) : super(key: key);

  final News? news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: TalebSizes.w32),
      child: SizedBox(
        width: TalebSizes.w265,
        child: Stack(
          children: [
            TalebImageWidget(
              height: TalebSizes.h200,
              borderRadius: TalebBorderRadius.r20,
              image: url,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(TalebPadding.p12),
                width: TalebSizes.w232,
                decoration: BoxDecoration(
                  color: TalebColors.white,
                  borderRadius: BorderRadius.circular(TalebBorderRadius.r8),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'ترجمة لرؤى و تطلعات جلالة الملك عبدالله الثاني المعظم ',
                      style:
                          Theme.of(context).textTheme.headlineLarge?.elephant,
                    ),
                    VerticalSpace(TalebSizes.h8),
                    RowAdditionalInfoWithCity(
                      hasCity: false,
                      cityName: news!.city.name,
                      user: news!.user,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
