import 'package:flutter/material.dart';
import 'package:taleb/core/resources/import_resources.dart';
import 'package:taleb/core/widget/taleb_divider.dart';
import 'package:taleb/features/home/offer/presentations/service_provider_offer/tabs/widget/service_provider_social_info_row.dart';

class ServiceProviderOffersDetailsTabPage extends StatelessWidget {
  const ServiceProviderOffersDetailsTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TalebDivider2(),
        VerticalSpace(TalebSizes.h16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: TalebPadding.p16),
          child: Column(
            children: [
              Text(
                '''
جامعة الزيتونة الأردنية جامعة خاصة تقع في العاصمة عمان 
على طريق مطار الملكة علياء الدولي تأسست عام 1993، 
وحصلت على الترخيص والاعتماد في تاريخ 6 سيبتمبر 1993، 
بموجب قرار مجلس التعليم العالي رقم وهي تسعى منذ 
تأسيسها لإعداد الطالب إعدادا علمياً وخلقياً، ليكون قادرا 
بالنهوض بمسئوليته في خدمة وطنه وأمته.
''',
                style: Theme.of(context).textTheme.displayLarge?.elephant,
              ),
              ServiceProviderSocialInfoRow(
                onTap: () => {},
                socialInfo: '+962 7 8888 8888',
                icon: TalebIcons.call,
              ),
              VerticalSpace(TalebSizes.h16),
              ServiceProviderSocialInfoRow(
                onTap: () => {},
                socialInfo: 'info@taleb.jo',
                icon: TalebIcons.email,
              ),
              VerticalSpace(TalebSizes.h16),
              ServiceProviderSocialInfoRow(
                onTap: () => {},
                socialInfo: 'https://www.google.com',
                icon: TalebIcons.urlSite,
              ),
              VerticalSpace(TalebSizes.h16),
              ServiceProviderSocialInfoRow(
                onTap: () => {},
                socialInfo: 'جامعة الزيتونة الأردنية',
                icon: TalebIcons.facebook,
              ),
              VerticalSpace(TalebSizes.h16),
              ServiceProviderSocialInfoRow(
                onTap: () => {},
                socialInfo: 'AlZaytoonahUniversityOfficial',
                icon: TalebIcons.instagram,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
