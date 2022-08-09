import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_colors.dart';
import 'package:taleb/core/resources/taleb_size_box.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';

import 'widgets/filter_widget.dart';
import 'widgets/search_widget.dart';
import 'widgets/taleb_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(
        title: 'الأخبار',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: TalebPadding.p16),
        child: Column(
          children: [
            HorizontalSpace(TalebSizes.w8),
            Row(
              children: [
                const SearchWidget(),
                HorizontalSpace(TalebSizes.w8),
                const FilterWidget(),
              ],
            ),
            Expanded(
              child: ListView(
                children: list,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

var list = List.generate(
  100,
  (index) => const NewsCardWidget(),
);

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(TalebPadding.p12),
      margin: EdgeInsets.only(top: TalebPadding.p12),
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(TalebBorderRadius.r12),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://images.pexels.com/photos/1172253/pexels-photo-1172253.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                ),
              ),
            ),
            child: SizedBox(
              height: TalebSizes.h240,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          VerticalSpace(TalebSizes.h8),
          SizedBox(
            height: TalebSizes.h24,
            child: Row(
              children: [
                const Text('2 أغسطس 2022'),
                const Spacer(),
                Container(
                  padding: EdgeInsets.only(
                    right: TalebPadding.p2,
                    left: TalebPadding.p8,
                    top: TalebPadding.p2,
                    bottom: TalebPadding.p2,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xff37b0cc),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 10,
                        backgroundImage: NetworkImage(
                          'https://images.pexels.com/photos/1172253/pexels-photo-1172253.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'وزارة الشباب',
                        style: Theme.of(context).textTheme.titleSmall!.white,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  height: 24,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2.0,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xff37b0cc),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: Text(
                    'عمان',
                    style: Theme.of(context).textTheme.titleSmall!.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'ترجمة لرؤى وتطلعات جلالة الملك عبدالله الثاني المعظم في إيجاد جيل من الشباب المسلح بالمعرفة والعلم والانتماء، ليكون شريكا فاعلا في بناء حياتنا السياسية والاقتصادية والثقافية بعيدا عن التطرف والغلو، وفقا لما ',
            style: Theme.of(context).textTheme.labelLarge!.chathamsBlue,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
