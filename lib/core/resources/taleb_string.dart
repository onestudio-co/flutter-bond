import 'package:easy_localization/easy_localization.dart';
import 'package:taleb/features/home/offer/presentations/offers/widget/offer_service_proivder_button.dart';
import 'package:taleb/generator/langs/locale_keys.g.dart';

class TalebStrings {
  //* News Page
  static String newsHomeTitleAppbar = LocaleKeys.homeTitle.tr();
  static String skip = 'تخطي';
  static String startNow = 'ابدأ الآن';

  /// [Offers]
  static String offersPageAppbarTitle =
      LocaleKeys.offer_offers_page_appbar_title.tr();
  static String offersPageHintSearchTextField =
      LocaleKeys.offer_offers_page_hint_search_text_field.tr();

  /// [Home BottomNavBar]
  static String bottomNavBarHome = LocaleKeys.home_bottom_nav_bar_home.tr();
  static String bottomNavBarSooq = LocaleKeys.home_bottom_nav_bar_sooq.tr();
  static String bottomNavBarNews = LocaleKeys.home_bottom_nav_bar_news.tr();
  static String bottomNavBarOpportunities =
      LocaleKeys.home_bottom_nav_bar_opportunities.tr();
  static String bottomNavBarMore = LocaleKeys.home_bottom_nav_bar_more.tr();

  /// [OfferServiceProvider TabBar]
  static String serviceProviderOffersDetailsTab = 'التفاصيل';
  static String serviceProviderOffersOffersTab = 'العروض';
}
