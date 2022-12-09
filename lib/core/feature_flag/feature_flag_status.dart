enum FeatureFlagStatus { enabled, disable }

extension on FeatureFlagStatus {
  T defaultValue<T>() {
    if (T == bool) {
      return (this == FeatureFlagStatus.enabled ? true : false) as T;
    } else if (T == String) {
      return 'none' as T;
    } else {
      throw 'Unsupported type';
    }
  }
}
