typedef CacheDriverReturnType = Future<dynamic>;

abstract class CacheDriver {
  CacheDriverReturnType get(String key, [dynamic defaultValue]);
  Future<bool> has(String key);
  Future<bool> put(String key, dynamic value, [Duration? expiredAfter]);
}

class CacheData {
  final dynamic data;
  final DateTime? expiredAt;

  CacheData({required this.data, required this.expiredAt});

  bool get isValid =>
      expiredAt == null ? true : DateTime.now().isBefore(expiredAt!);

  factory CacheData.fromJson(Map<String, dynamic> json) => CacheData(
        data: json['data'],
        expiredAt: json['expiredAt'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(
                json['expiredAt'],
              ),
      );

  Map<String, dynamic> toJson() => {
        'data': data,
        'expiredAt': expiredAt?.millisecondsSinceEpoch,
      };
}
