import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:one_studio_core/core.dart';

class FirebaseAnalyticsProvider extends AnalyticsProvider {
  FirebaseAnalyticsProvider(this._firebaseAnalytics);

  final FirebaseAnalytics _firebaseAnalytics;

  @override
  void logEvent(AnalyticsEvent event) {
    if (event.key != null) {
      final String eventKey = event.key!.toLowerCase().replaceAll(' ', '_');
      _firebaseAnalytics.logEvent(
        name: eventKey,
        parameters: event.params,
      );
    }
  }

  @override
  void logBeginTutorial() {
    _firebaseAnalytics.logTutorialBegin();
  }

  @override
  void logCompleteTutorial() {
    _firebaseAnalytics.logTutorialComplete();
  }

  @override
  void logSignedIn(UserSignedIn event) {
    _firebaseAnalytics.setUserId(id: event.id.toString());
    _firebaseAnalytics.logLogin(loginMethod: event.loginMethod);
  }

  @override
  void logSignedUp(UserSignedUp event) {
    _firebaseAnalytics.setUserId(id: event.id.toString());
    _firebaseAnalytics.logSignUp(signUpMethod: event.signupMethod);
  }

  @override
  void updateProfile(UserUpdateProfile event) {
    _firebaseAnalytics.setUserProperty(name: 'name', value: event.name);
    _firebaseAnalytics.setUserProperty(name: 'mobile', value: event.mobile);
    _firebaseAnalytics.setUserProperty(name: 'email', value: event.email);
    _firebaseAnalytics.setUserProperty(name: 'dob', value: event.dob);
    _firebaseAnalytics.setUserProperty(name: 'gender', value: event.gender);
    _firebaseAnalytics.setUserProperty(name: 'country', value: event.country);
    _firebaseAnalytics.setUserProperty(name: 'city', value: event.city);
    _firebaseAnalytics.setUserProperty(
        name: 'age', value: event.age.toString());
    event.customAttributes.forEach(_sendCustomAttributes);
  }

  @override
  void logViewItemList(UserViewedItemList event) {
    _firebaseAnalytics.logViewItemList(
      items: event.items?.map((item) => item.analyticsEventItem).toList(),
      itemListId: event.itemListId,
      itemListName: event.itemListName,
    );
  }

  @override
  void logViewItem(UserViewItem event) {
    _firebaseAnalytics.logViewItem(
      currency: event.currency,
      value: event.value,
      items: event.items?.map((item) => item.analyticsEventItem).toList(),
    );
  }

  @override
  void logSelectItem(UserSelectItem event) {
    _firebaseAnalytics.logSelectItem(
      itemListId: event.itemListId,
      itemListName: event.itemListName,
      items: event.items.map((item) => item.analyticsEventItem).toList(),
    );
  }

  @override
  void logViewPromotion(UserViewPromotion event) {
    _firebaseAnalytics.logViewPromotion(
      promotionId: event.promotionId,
      promotionName: event.promotionName,
      creativeName: event.creativeName,
      creativeSlot: event.creativeSlot,
      items: event.items?.map((item) => item.analyticsEventItem).toList(),
    );
  }

  @override
  void logSelectPromotion(UserSelectPromotion event) {
    _firebaseAnalytics.logSelectPromotion(
      promotionId: event.promotionId,
      promotionName: event.promotionName,
      creativeName: event.creativeName,
      creativeSlot: event.creativeSlot,
      items: event.items?.map((item) => item.analyticsEventItem).toList(),
    );
  }

  @override
  void logAddToCart(UserAddedToCart event) {
    _firebaseAnalytics.logAddToCart(
      items: event.items.map((item) => item.analyticsEventItem).toList(),
      value: event.value,
      currency: event.currency,
    );
  }

  @override
  void logRemoveFromCart(UserRemovedFromCart event) {
    _firebaseAnalytics.logRemoveFromCart(
      items: event.items.map((item) => item.analyticsEventItem).toList(),
      value: event.value,
      currency: event.currency,
    );
  }

  @override
  void logBeginCheckout(UserBeginCheckout event) {
    _firebaseAnalytics.logBeginCheckout(
      value: event.value,
      currency: event.currency,
      items: event.items.map((item) => item.analyticsEventItem).toList(),
    );
  }

  @override
  void logMadePurchase(UserMadePurchase event) {
    _firebaseAnalytics.logPurchase(
      transactionId: event.transactionId,
      value: event.value,
      tax: event.tax,
      currency: event.currency,
      coupon: event.coupon,
      items:
      event.items.map((EventItem item) => item.analyticsEventItem).toList(),
    );
  }

  @override
  void logRefundOrder(UserRefundOrder event) {
    _firebaseAnalytics.logRefund(
      transactionId: event.transactionId,
      value: event.value,
      tax: event.tax,
      currency: event.currency,
      coupon: event.coupon,
      items:
      event.items.map((EventItem item) => item.analyticsEventItem).toList(),
    );
  }

  void _sendCustomAttributes(String key, dynamic value) {
    var userPropertyKey = key.toLowerCase().replaceAll(' ', '_');
    debugPrint('FirebaseAnalytics send custom user attribute with key: '
        '$userPropertyKey, '
        'value: $value and value type: ${value.runtimeType}');
    if (value is DateTime) {
      final DateFormat formatter =
      DateFormat("'~t'yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
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
