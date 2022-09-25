import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:one_studio_core/core.dart';

class FirebaseAnalyticsProvider implements AnalyticsProvider {
  FirebaseAnalyticsProvider(this._firebaseAnalytics);

  final FirebaseAnalytics _firebaseAnalytics;

  @override
  void log(AnalyticsEvent event) {
    final String eventKey = event.key.toLowerCase().replaceAll(' ', '_');
    if (event is UserLoggedIn) {
      final UserLoggedIn userLoggedIn = event as UserLoggedIn;
      _firebaseAnalytics.setUserId(id: userLoggedIn.id.toString());
      _firebaseAnalytics.logLogin(loginMethod: userLoggedIn.loginMethod);
    } else if (event is UserSignedUp) {
      final UserSignedUp userSignedUp = event as UserSignedUp;
      _firebaseAnalytics.setUserId(id: userSignedUp.id.toString());
      _firebaseAnalytics.logSignUp(signUpMethod: userSignedUp.signupMethod);
    } else if (event is UserUpdateProfile) {
      final UserUpdateProfile user = event as UserUpdateProfile;
      _firebaseAnalytics.setUserProperty(name: 'name', value: user.name);
      _firebaseAnalytics.setUserProperty(name: 'mobile', value: user.mobile);
      _firebaseAnalytics.setUserProperty(name: 'email', value: user.email);
      _firebaseAnalytics.setUserProperty(name: 'dob', value: user.dob);
      _firebaseAnalytics.setUserProperty(name: 'gender', value: user.gender);
      _firebaseAnalytics.setUserProperty(name: 'country', value: user.country);
      _firebaseAnalytics.setUserProperty(name: 'city', value: user.city);
      _firebaseAnalytics.setUserProperty(
          name: 'age', value: user.age.toString());
      user.customAttributes.forEach(_sendCustomAttributes);
      _firebaseAnalytics.logEvent(name: eventKey, parameters: event.params);
    } else if (event is UserViewedItemList) {
      _firebaseAnalytics.logViewItemList();
    } else if (event is UserAddedToCart) {
      final UserAddedToCart userAddedToCart = event as UserAddedToCart;
      _firebaseAnalytics.logAddToCart(
          items: userAddedToCart.items
              .map((CartItem item) => item.analyticsEventItem)
              .toList(),
          value: userAddedToCart.value,
          currency: userAddedToCart.currency);
    } else if (event is UserBeginCheckout) {
      final UserBeginCheckout userBeginCheckout = event as UserBeginCheckout;
      _firebaseAnalytics.logBeginCheckout(
        value: userBeginCheckout.value,
        currency: userBeginCheckout.currency,
        items: userBeginCheckout.items
            .map((CartItem item) => item.analyticsEventItem)
            .toList(),
      );
    } else if (event is UserMadePurchase) {
      final UserMadePurchase userMadePurchase = event as UserMadePurchase;
      _firebaseAnalytics.logPurchase(
        transactionId: userMadePurchase.transactionId,
        value: userMadePurchase.value,
        tax: userMadePurchase.tax,
        currency: userMadePurchase.currency,
        coupon: userMadePurchase.coupon,
        items: userMadePurchase.items
            .map((CartItem item) => item.analyticsEventItem)
            .toList(),
      );
    } else if (event is UserBeginTutorial) {
      _firebaseAnalytics.logTutorialBegin();
    } else if (event is UserCompleteTutorial) {
      _firebaseAnalytics.logTutorialComplete();
    } else {
      _firebaseAnalytics.logEvent(name: eventKey, parameters: event.params);
    }
  }

  void _sendCustomAttributes(String key, dynamic value) {
    var userPropertyKey = key.toLowerCase().replaceAll(' ', '_');
    debugPrint(
        'FirebaseAnalytics send custom user attribute with key: $userPropertyKey, value: $value and value type: ${value.runtimeType}');
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
