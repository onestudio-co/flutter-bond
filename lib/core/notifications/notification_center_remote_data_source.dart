import 'package:bond_network/bond_network.dart';
import 'package:bond_notifications/bond_notifications.dart';
import 'package:dio/dio.dart';

class NotificationCenterRemoteDataSource extends NotificationCenterDataSource {
  final ApiClient _client;

  NotificationCenterRemoteDataSource(this._client);

  @override
  Future<ListResponse<ServerNotificationModel>> loadNotifications(
      {String? nextUrl}) async {
    final Response<dynamic> response = await _client.get(
      nextUrl ?? NotificationsApis.notifications,
      headers: Api.headers(),
    );
    return mapListResponse(response);
  }

  @override
  Future<void> read(String uuid) async {
    await _client.post(
      NotificationsApis.read(uuid),
      headers: Api.headers(),
    );
  }

  @override
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
