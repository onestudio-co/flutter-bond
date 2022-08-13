import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taleb/core/resources/taleb_colors.dart';
import 'package:taleb/core/resources/taleb_icons.dart';
import 'package:taleb/core/resources/taleb_size_box.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';
import 'package:taleb/main.dart';

import '../widgets/news_date_and_searvice_provider.dart';
import '../widgets/news_image.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(TalebIcons.favorites),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(TalebIcons.share),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: TalebPadding.p16, vertical: TalebPadding.p12),
          child: Column(
            children: [
              NewsImageWidget(
                image: url,
                height: TalebSizes.h290,
              ),
              VerticalSpace(TalebSizes.h8),
              const NewsDateAndSearviceProviderWidget(),
              VerticalSpace(TalebSizes.h12),
              Text(
                'ترجمة لرؤى وتطلعات جلالة الملك ترجمة لرؤى وتطلعات جلالة الملك ترجمة لرؤى وتطلعات جلالة الملك',
                style: Theme.of(context).textTheme.headlineMedium!.elephant,
              ),
              VerticalSpace(TalebSizes.h12),
              Text(
                'ترجمة لرؤى وتطلعات جلالة الملك عبدالله الثاني المعظم في إيجاد جيل من الشباب المسلح بالمعرفة والعلم والانتماء، ليكون شريكا فاعلا في بناء حياتنا السياسية والاقتصادية والثقافية بعيدا عن التطرف والغلو، وفقا لما جاء في كتاب التكليف السامي لحكومة الدكتور هاني الملقي، وتنفيذا للتوجيهات الملكية في كتاب التكليف فيما يتعلق بالشباب ونقتبس منه " وأما قطاع الشباب، فإنه بحاجة إلى اهتمام حكومي أكبر نظراً لما عاناه العمل الشبابي خلال السنوات الماضية من افتقار للرعاية الكافية، التي تساعد الشباب على إيجاد فرص الحياة الكريمة.',
                style: Theme.of(context).textTheme.displayLarge!.elephant,
              ),
              // const SimilarNewsWidget()
            ],
          ),
        ),
      ),
    );
  }
}
