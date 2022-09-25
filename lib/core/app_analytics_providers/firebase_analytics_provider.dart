import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:one_studio_core/core.dart';

class FirebaseAnalyticsProvider extends AnalyticsProvider {
  FirebaseAnalyticsProvider(this._firebaseAnalytics);

  final FirebaseAnalytics _firebaseAnalytics;

  @override
  void logEvent(AnalyticsEvent event) {
    final String eventKey = event.key.toLowerCase().replaceAll(' ', '_');
    _firebaseAnalytics.logEvent(
      name: eventKey,
      parameters: event.params,
    );
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
  void logSignedIn(UserLoggedIn event) {
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
  void logViewItemList() {
    _firebaseAnalytics.logViewItemList();
  }

  @override
  void logAddToCart(UserAddedToCart event) {
    _firebaseAnalytics.logAddToCart(
        items: event.items
            .map((CartItem item) => item.analyticsEventItem)
            .toList(),
        value: event.value,
        currency: event.currency);
  }

  @override
  void logBeginCheckout(UserBeginCheckout event) {
    _firebaseAnalytics.logBeginCheckout(
      value: event.value,
      currency: event.currency,
      items:
          event.items.map((CartItem item) => item.analyticsEventItem).toList(),
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
          event.items.map((CartItem item) => item.analyticsEventItem).toList(),
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

extension FirebaseCartItem on CartItem {
  AnalyticsEventItem get analyticsEventItem => AnalyticsEventItem(
      itemId: id,
      itemName: name,
      itemCategory: category,
      price: price,
      quantity: quantity,
      currency: currency);
}
