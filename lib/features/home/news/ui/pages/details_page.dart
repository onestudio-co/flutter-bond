import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taleb/core/resources/taleb_colors.dart';
import 'package:taleb/core/resources/taleb_icons.dart';
import 'package:taleb/core/resources/taleb_size_box.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';
import 'package:taleb/main.dart';

import '../widgets/additional_info_row.dart';
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
              VerticalSpace(TalebSizes.h16),
              const NewsDateAndSearviceProviderWidget(),
              VerticalSpace(TalebSizes.h12),
              Text(
                'ترجمة لرؤى وتطلعات جلالة الملك ترجمة لرؤى وتطلعات جلالة الملك ترجمة لرؤى وتطلعات جلالة الملك',
                style: Theme.of(context).textTheme.headlineMedium!.elephant,
              ),
              VerticalSpace(TalebSizes.h12),
              Padding(
                padding: EdgeInsets.only(bottom: TalebPadding.p32),
                child: Text(
                  'ترجمة لرؤى وتطلعات جلالة الملك عبدالله الثاني المعظم في إيجاد جيل من الشباب المسلح بالمعرفة والعلم والانتماء، ليكون شريكا فاعلا في بناء حياتنا السياسية والاقتصادية والثقافية بعيدا عن التطرف والغلو، وفقا لما جاء في كتاب التكليف السامي لحكومة الدكتور هاني الملقي، وتنفيذا للتوجيهات الملكية في كتاب التكليف فيما يتعلق بالشباب ونقتبس منه " وأما قطاع الشباب، فإنه بحاجة إلى اهتمام حكومي أكبر نظراً لما عاناه العمل الشبابي خلال السنوات الماضية من افتقار للرعاية الكافية، التي تساعد الشباب على إيجاد فرص الحياة الكريمة.',
                  style: Theme.of(context).textTheme.displayLarge!.elephant,
                ),
              ),
              const SimilarNewsWidget()
            ],
          ),
        ),
      ),
    );
  }
}

class SimilarNewsWidget extends StatelessWidget {
  const SimilarNewsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: TalebSizes.h370,
      width: MediaQuery.of(context).size.width,
      color: TalebColors.custome1,
      padding: EdgeInsets.symmetric(
        horizontal: TalebPadding.p16,
        vertical: TalebPadding.p32,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SimilerNewsTitleWidget(),
          VerticalSpace(TalebSizes.h16),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const SimilerNewsContentWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SimilerNewsContentWidget extends StatelessWidget {
  const SimilerNewsContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: TalebSizes.w32),
      child: SizedBox(
        width: TalebSizes.w265,
        child: Stack(
          children: [
            NewsImageWidget(
              height: TalebSizes.h200,
              borderRadius: TalebBorderRadius.r20,
              image: url,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(TalebPadding.p12),
                height: TalebSizes.h111,
                width: TalebSizes.w232,
                decoration: BoxDecoration(
                  color: TalebColors.white,
                  borderRadius: BorderRadius.circular(TalebBorderRadius.r8),
                ),
                child: Column(
                  children: [
                    Text(
                      'ترجمة لرؤى و تطلعات جلالة الملك عبدالله الثاني المعظم ',
                      style:
                          Theme.of(context).textTheme.headlineLarge?.elephant,
                    ),
                    VerticalSpace(TalebSizes.h8),
                    const RowAdditionalInfo(hasCity: false),
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

class SimilerNewsTitleWidget extends StatelessWidget {
  const SimilerNewsTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const DecorationLabelSimilerWidget(),
        HorizontalSpace(TalebSizes.w8),
        Text(
          'أخبار مماثلة',
          style: Theme.of(context).textTheme.titleMedium?.elephant,
        )
      ],
    );
  }
}

class DecorationLabelSimilerWidget extends StatelessWidget {
  const DecorationLabelSimilerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: TalebSizes.w22,
      height: TalebSizes.h22,
      decoration: const BoxDecoration(
        color: TalebColors.blueRegular,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: TalebColors.white,
          ),
          child: Container(),
        ),
      ),
    );
  }
}
