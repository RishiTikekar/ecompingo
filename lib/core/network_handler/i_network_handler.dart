import 'package:dio/dio.dart';

part 'network_calls.dart';

part 'network_handler.dart';

abstract class INetworkHandler {
  Future<Map<String, dynamic>?> get({
    required String path,
    Map<String, String>? headers,
    Map<String, String>? body,
    Map<String, String>? queryParams,
  });
}
