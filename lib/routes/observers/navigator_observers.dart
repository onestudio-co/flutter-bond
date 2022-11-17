library navigator_observers;

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

List<RouteObserver> navigatorObservers() => [
      FirebaseAnalyticsObserver(
        analytics: FirebaseAnalytics.instance,
        nameExtractor: (routeSettings) =>
            routeSettings.name?.replaceAll('Route', ''),
      ),
    ];
