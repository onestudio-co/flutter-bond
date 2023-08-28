class UpdateAppDefaultValue {
  static const Map<String, dynamic> defaultParameters = {
    'appCurrentVersion':
        '{"ios":{"min_version":0,"max_version":0,"message":"حماية خصوصيتك تهمنا وأن تحصل على أفضل تجربة استخدام من أولوياتنا، يرجى تحديث نسختك الحالية"},"android":{"min_version":0,"max_version":0,"message":"حماية خصوصيتك تهمنا وأن تحصل على أفضل تجربة استخدام من أولوياتنا، يرجى تحديث نسختك الحالية"}}'
  };
  static const fetchTimeout = Duration(minutes: 1);
  static const minimumFetchInterval = Duration(minutes: 5);
}
