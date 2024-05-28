import 'package:bond_app_analytics/bond_app_analytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class FirebaseAnalyticsProvider extends AnalyticsProvider {
  FirebaseAnalyticsProvider(this._firebaseAnalytics);

  final FirebaseAnalytics _firebaseAnalytics;

  @override
  void setUserId(int userId) {
    _firebaseAnalytics.setUserId(id: userId.toString());
  }

  @override
  void logEvent(AnalyticsEvent event) {
    if (event.key == null) return;
    _firebaseAnalytics.logEvent(
      name: event.key!,
      parameters: event.params,
    );
  }

  @override
  void setUserAttributes(Map<String, dynamic> attributes) {
    attributes.forEach(_sendCustomAttributes);
  }

  @override
  void logBeginTutorial(AnalyticsEvent event) {
    _firebaseAnalytics.logTutorialBegin();
  }

  @override
  void logCompleteTutorial(AnalyticsEvent event) {
    _firebaseAnalytics.logTutorialComplete();
  }

  @override
  void logSignedIn(AnalyticsEvent event, UserSignedIn data) {
    setUserId(data.id);
    _firebaseAnalytics.logLogin(loginMethod: data.loginMethod);
  }

  @override
  void logSignedUp(AnalyticsEvent event, UserSignedUp data) {
    setUserId(data.id);
    _firebaseAnalytics.logSignUp(signUpMethod: data.signupMethod);
  }

  @override
  void updateProfile(AnalyticsEvent event, UserUpdateProfile data) {
    _firebaseAnalytics.setUserProperty(name: 'name', value: data.name);
    _firebaseAnalytics.setUserProperty(name: 'mobile', value: data.mobile);
    _firebaseAnalytics.setUserProperty(name: 'email', value: data.email);
    _firebaseAnalytics.setUserProperty(name: 'dob', value: data.dob);
    _firebaseAnalytics.setUserProperty(name: 'gender', value: data.gender);
    _firebaseAnalytics.setUserProperty(name: 'country', value: data.country);
    _firebaseAnalytics.setUserProperty(name: 'city', value: data.city);
    _firebaseAnalytics.setUserProperty(name: 'age', value: data.age.toString());
    data.customAttributes.forEach(_sendCustomAttributes);
  }

  @override
  void logViewItemList(AnalyticsEvent event, UserViewedItemList data) {
    _firebaseAnalytics.logViewItemList(
      items: data.items?.map((item) => item.analyticsEventItem).toList(),
      itemListId: data.itemListId,
      itemListName: data.itemListName,
    );
  }

  @override
  void logViewItem(AnalyticsEvent event, UserViewItem data) {
    _firebaseAnalytics.logViewItem(
      currency: data.currency,
      value: data.value,
      items: data.items?.map((item) => item.analyticsEventItem).toList(),
    );
  }

  @override
  void logSelectItem(AnalyticsEvent event, UserSelectItem data) {
    _firebaseAnalytics.logSelectItem(
      itemListId: data.itemListId,
      itemListName: data.itemListName,
      items: data.items.map((item) => item.analyticsEventItem).toList(),
    );
  }

  @override
  void logViewPromotion(AnalyticsEvent event, UserViewPromotion data) {
    _firebaseAnalytics.logViewPromotion(
      promotionId: data.promotionId,
      promotionName: data.promotionName,
      creativeName: data.creativeName,
      creativeSlot: data.creativeSlot,
      items: data.items?.map((item) => item.analyticsEventItem).toList(),
    );
  }

  @override
  void logSelectPromotion(AnalyticsEvent event, UserSelectPromotion data) {
    _firebaseAnalytics.logSelectPromotion(
      promotionId: data.promotionId,
      promotionName: data.promotionName,
      creativeName: data.creativeName,
      creativeSlot: data.creativeSlot,
      items: data.items?.map((item) => item.analyticsEventItem).toList(),
    );
  }

  @override
  void logAddToCart(AnalyticsEvent event, UserAddedToCart data) {
    _firebaseAnalytics.logAddToCart(
      items: data.items.map((item) => item.analyticsEventItem).toList(),
      value: data.value,
      currency: data.currency,
    );
  }

  @override
  void logRemoveFromCart(AnalyticsEvent event, UserRemovedFromCart data) {
    _firebaseAnalytics.logRemoveFromCart(
      items: data.items.map((item) => item.analyticsEventItem).toList(),
      value: data.value,
      currency: data.currency,
    );
  }

  @override
  void logBeginCheckout(AnalyticsEvent event, UserBeginCheckout data) {
    _firebaseAnalytics.logBeginCheckout(
      value: data.value,
      currency: data.currency,
      items: data.items.map((item) => item.analyticsEventItem).toList(),
    );
  }

  @override
  void logMadePurchase(AnalyticsEvent event, UserMadePurchase data) {
    _firebaseAnalytics.logPurchase(
      transactionId: data.transactionId,
      value: data.value,
      tax: data.tax,
      currency: data.currency,
      coupon: data.coupon,
      items:
          data.items.map((EventItem item) => item.analyticsEventItem).toList(),
    );
  }

  @override
  void logRefundOrder(AnalyticsEvent event, UserRefundOrder data) {
    _firebaseAnalytics.logRefund(
      transactionId: data.transactionId,
      value: data.value,
      tax: data.tax,
      currency: data.currency,
      coupon: data.coupon,
      items:
          data.items.map((EventItem item) => item.analyticsEventItem).toList(),
    );
  }

  @override
  void logSearch(AnalyticsEvent event, UserSearch data) {
    _firebaseAnalytics.logSearch(
      searchTerm: data.searchTerm,
    );
  }

  @override
  void logShareContent(AnalyticsEvent event, UserShareContent data) {
    _firebaseAnalytics.logShare(
      contentType: data.contentType,
      itemId: data.itemId,
      method: data.method ?? 'unknown',
    );
  }

  @override
  void logViewSearchResults(AnalyticsEvent event, UserViewSearchResult data) {
    _firebaseAnalytics.logViewSearchResults(
      searchTerm: data.searchTerm,
    );
  }

  void _sendCustomAttributes(String key, dynamic value) {
    var userPropertyKey = key.toLowerCase().replaceAll(' ', '_');
    debugPrint('FirebaseAnalytics send custom user attribute with key: '
        '$userPropertyKey, '
        'value: $value and value type: ${value.runtimeType}');
    if (value is DateTime) {
      final formatter = DateFormat("'~t'yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
      _firebaseAnalytics.setUserProperty(
          name: userPropertyKey, value: formatter.format(value));
    } else {
      _firebaseAnalytics.setUserProperty(
          name: userPropertyKey, value: value.toString());
    }
  }
}

extension FirebaseCartItem on EventItem {
  AnalyticsEventItem get analyticsEventItem => AnalyticsEventItem(
        affiliation: affiliation,
        currency: currency,
        coupon: coupon,
        creativeName: creativeName,
        creativeSlot: creativeSlot,
        discount: discount,
        index: index,
        itemBrand: itemBrand,
        itemCategory: itemCategory,
        itemCategory2: itemCategory2,
        itemCategory3: itemCategory3,
        itemCategory4: itemCategory4,
        itemCategory5: itemCategory5,
        itemId: itemId,
        itemListId: itemListId,
        itemListName: itemListName,
        itemName: itemName,
        itemVariant: itemVariant,
        locationId: locationId,
        price: price,
        promotionId: promotionId,
        promotionName: promotionName,
        quantity: quantity,
      );
}
