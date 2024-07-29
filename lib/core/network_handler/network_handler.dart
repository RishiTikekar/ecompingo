part of 'i_network_handler.dart';

class NetworkHandler implements INetworkHandler {
  late Dio _dio;

  NetworkHandler() {
    init();
  }

  init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://dummyjson.com/',
        connectTimeout: const Duration(seconds: 10),
      ),
    );
  }

  @override
  Future<Map<String, dynamic>?> get({
    required String path,
    Map<String, String>? headers,
    Map<String, String>? body,
    Map<String, String>? queryParams,
  }) async {
    final response = await _dio.get(
      path,
      data: body,
      options: Options(
        headers: headers,
      ),
      queryParameters: queryParams,
    );
    return response.data;
  }
}
