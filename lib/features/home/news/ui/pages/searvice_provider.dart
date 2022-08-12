import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_colors.dart';
import 'package:taleb/core/resources/taleb_size_box.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';
import 'package:taleb/features/home/news/ui/pages/news_page.dart';
import 'package:taleb/main.dart';

class SearviceProviderNewsPage extends StatelessWidget {
  const SearviceProviderNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TalebColors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: TalebColors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  VerticalSpace(TalebSizes.h8),
                  CircleAvatar(
                    radius: TalebSizes.h40,
                    backgroundColor: TalebColors.greyRegular,
                    child: CircleAvatar(
                      radius: TalebSizes.h38,
                      backgroundImage: NetworkImage(url),
                    ),
                  ),
                  VerticalSpace(TalebSizes.h8),
                  Text(
                    'وزراة الشباب',
                    style:
                        Theme.of(context).textTheme.labelMedium?.chathamsBlue,
                  ),
                  VerticalSpace(TalebSizes.h2),
                  Text(
                    'عمان',
                    style: Theme.of(context).textTheme.bodyMedium?.coolGrey,
                  ),
                  VerticalSpace(TalebSizes.h20),
                ],
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return list[index];
              },
            ),
          ],
        ),
      ),
    );
  }
}
