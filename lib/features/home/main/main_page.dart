import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/slider_news_image.dart';
import 'package:taleb/core/widget/taleb_divider.dart';
import 'package:taleb/features/home/main/widgets/header_slider.dart';
import 'package:taleb/main.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          TalebIcons.talebLogo,
          height: TalebSizes.h40,
          width: TalebSizes.w40,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            VerticalSpace(TalebSizes.h8),
            const TalebDivider2(),
            VerticalSpace(TalebSizes.h8),
            TalebSliderImagesWidget(
              padding: EdgeInsets.symmetric(horizontal: TalebPadding.p8),
              index: 1,
              image: url,
            ),
            VerticalSpace(TalebSizes.h44),
            HeaderSlider(
              title: TalebStrings.homeSliderLastOffers,
              onTapSeeMore: () {},
            ),
            SizedBox(
              height: TalebSizes.h312,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  // return NewsCardWidget(news: );
                  return Container(
                    width: 90,
                    color: Colors.red,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
