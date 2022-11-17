import 'package:dio/dio.dart';
import 'package:one_studio_core/core.dart';

class NotificationCenterRemoteDataSource extends NotificationCenterDataSource {
  final ApiClient _client;

  NotificationCenterRemoteDataSource(this._client);

  Future<ListResponse<ServerNotificationModel>> loadNotifications(
      {String? nextUrl}) async {
    final Response<dynamic> response = await _client.get(
      nextUrl ?? NotificationsApis.notifications,
      headers: Api.headers(),
    );
    return mapListResponse(response);
  }

  Future<void> read(String uuid) async {
    await _client.post(
      NotificationsApis.read(uuid),
      headers: Api.headers(),
    );
  }

  Future<void> readAll() async {
    await _client.post(
      NotificationsApis.readAll,
      headers: Api.headers(),
    );
  }
}

extension NotificationsApis on Api {
  static String get notifications => 'notifications';

  static String read(String id) => 'notifications/$id/read';

  static String get readAll => 'notifications/read-all';
}
