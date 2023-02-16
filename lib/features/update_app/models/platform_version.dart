class PlatformVersion {
  const PlatformVersion({
    required this.minVersion,
    required this.maxVersion,
    required this.message,
  });

  final int minVersion;
  final int maxVersion;
  final String message;

  factory PlatformVersion.fromJson(Map<String, dynamic> json) =>
      PlatformVersion(
        minVersion: json['min_version'],
        maxVersion: json['max_version'],
        message: json['message'],
      );

  Map<String, dynamic> toJson() => {
        'min_version': minVersion,
        'max_version': maxVersion,
        'message': message,
      };
}
