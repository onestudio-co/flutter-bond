import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/features/home/news/ui/news_details/widget/slider_news_image.dart';
import 'package:taleb/features/home/widgets/slide_similers/main_widget.dart';

import 'widget/news_date_and_searvice_provider.dart';

class NewsDetailsPage extends StatelessWidget {
  const NewsDetailsPage({Key? key}) : super(key: key);

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
          padding: EdgeInsets.symmetric(vertical: TalebSizes.h12),
          child: Column(
            children: [
              const SliderNews(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: TalebPadding.p16),
                child: Column(
                  children: [
                    VerticalSpace(TalebSizes.h16),
                    const NewsDateAndSearviceProviderWidget(),
                    VerticalSpace(TalebSizes.h12),
                    Text(
                      'ترجمة لرؤى وتطلعات جلالة الملك ترجمة لرؤى وتطلعات جلالة الملك ترجمة لرؤى وتطلعات جلالة الملك',
                      style:
                          Theme.of(context).textTheme.headlineMedium!.elephant,
                    ),
                    VerticalSpace(TalebSizes.h12),
                    Padding(
                      padding: EdgeInsets.only(bottom: TalebPadding.p32),
                      child: Text(
                        'ترجمة لرؤى وتطلعات جلالة الملك عبدالله الثاني المعظم في إيجاد جيل من الشباب المسلح بالمعرفة والعلم والانتماء، ليكون شريكا فاعلا في بناء حياتنا السياسية والاقتصادية والثقافية بعيدا عن التطرف والغلو، وفقا لما جاء في كتاب التكليف السامي لحكومة الدكتور هاني الملقي، وتنفيذا للتوجيهات الملكية في كتاب التكليف فيما يتعلق بالشباب ونقتبس منه " وأما قطاع الشباب، فإنه بحاجة إلى اهتمام حكومي أكبر نظراً لما عاناه العمل الشبابي خلال السنوات الماضية من افتقار للرعاية الكافية، التي تساعد الشباب على إيجاد فرص الحياة الكريمة.',
                        style:
                            Theme.of(context).textTheme.displayLarge!.elephant,
                      ),
                    ),
                    const SimilarMainWidget(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
