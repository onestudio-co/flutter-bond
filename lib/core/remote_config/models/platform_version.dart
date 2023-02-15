class PlatformVersion {
  const PlatformVersion({this.minVersion, this.maxVersion, this.message});

  final int? minVersion;
  final int? maxVersion;
  final String? message;

  factory PlatformVersion.fromJson(Map<String, dynamic> json) =>
      PlatformVersion(
        minVersion: json['min_version'] as int?,
        maxVersion: json['max_version'] as int?,
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'min_version': minVersion,
        'max_version': maxVersion,
        'message': message,
      };
}
