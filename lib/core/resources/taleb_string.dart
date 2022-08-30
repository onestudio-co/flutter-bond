import 'package:easy_localization/easy_localization.dart';
import 'package:taleb/generator/langs/locale_keys.g.dart';

class TalebStrings {
  /// [General Strings]
  static String saveButton = 'حفظ';
  static String clearButton = 'مسح';
  static String seeMore = 'شاهد المزيد';
  static String notFoundDataTitle = 'لم يتم العثور على نتائج';
  static String notFoundDataDescription =
      'حاول البحث عن شيء أكثر عمومية ، أو تحقق من الأخطاء الإملائية';

  /// [News Page]
  static String newsHomeTitleAppbar = LocaleKeys.homeTitle.tr();
  static String skip = 'تخطي';
  static String startNow = 'ابدأ الآن';

  /// [Offers]
  static String offersPageAppbarTitle =
      LocaleKeys.offer_offers_page_appbar_title.tr();
  static String offersPageHintSearchTextField =
      LocaleKeys.offer_offers_page_hint_search_text_field.tr();

  /// [Opportunities Page]
  static String opportunitiesPageAppbarTitle = 'الفرص';
  static String opportunitiesPageHintTextField = 'ابحث في الفرص';

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

  /// [FilterOffer Page]
  static String offerFilterTitle = 'تصفية النتائج';
  static String offerFilterDescription = 'الرجاء أختيار معلومات التصفية';
  static String offerFilterServiceProviderType = 'نوع مزود الخدمة';
  static String offerFilterCity = 'المدينة';

  /// [SearchPartner Page]
  static String searchServiceProviderCategoryTitle = 'اختيار نوع مزود الخدمة';
  static String searchServiceProviderCategoryHintTextField =
      'أكتب نوع مزود الخدمة';

  /// [Main Page]
  static String homeSliderLastOffers = 'آخر العروض';
  static String homeSliderLastNews = 'آخر الأخبار';
  static String homeSliderLastOpportunities = 'آخر الفرص';
  static String homeSliderPartners = 'شركاؤنا';

  ///[SearchCityPage]
  static String searchCitytitle = 'اختيار المدينة';
  static String searchCityTextFieldHint =  'أكتب اسم المدينة';
}
