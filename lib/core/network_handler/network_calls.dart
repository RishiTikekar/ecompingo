part of 'i_network_handler.dart';

class NetworkCalls {
  final networkHandler = NetworkHandler();

  Future<Map<String, dynamic>?> getAllProducts() {
    return networkHandler.get(path: 'products');
  }
}
