class PlatformVersion {
  const PlatformVersion({this.minVersion, this.maxVersion, this.message});

  final int? minVersion;
  final int? maxVersion;
  final String? message;

  factory PlatformVersion.fromJson(Map<String, dynamic> json) =>
      PlatformVersion(
        minVersion: json['min_version'] as int? ?? 81,
        maxVersion: json['max_version'] as int? ?? 81,
        message: json['message'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        'min_version': minVersion,
        'max_version': maxVersion,
        'message': message,
      };
}
