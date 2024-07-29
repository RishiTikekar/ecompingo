import 'package:ecommerce/common/utils.dart';
import 'package:ecommerce/core/firebase/remote_config/remote_config_keys.dart';
import 'package:ecommerce/core/state_management/loader_mixin.dart';
import 'package:ecommerce/di/injection.dart';
import 'package:ecommerce/features/home_screen/models/product.dart';
import 'package:flutter/material.dart';

class HomeScreenProvider with ChangeNotifier, LoaderMixin {
  final _networkService = getIt<NetworkCalls>();
  final _remoteConfigService = getIt<RemoteConfigHandler>();

  List productList = <Product>[];
  Object? error;
  bool canShowOffer = false;

  HomeScreenProvider() {
    init();
  }

  Future<void> init() async {
    isLoading = true;
    try {
      final response = await _networkService.getAllProducts();

      final isValidResponse = (response?.isNotEmpty ?? false) &&
          (response?['products'] is List && response?['products'].isNotEmpty);

      if (isValidResponse) {
        response?['products'].take(10).forEach(
          (product) {
            productList.add(
              Product.fromJson(product),
            );
          },
        );
      }

      canShowOffer = _remoteConfigService.getValue(
        RemoteConfigKeys.v1ShowOffer,
      )[RemoteConfigKeys.canShowOffer];
    } catch (err) {
      error = err;
      Utils.showToast(
        message: 'Something went wrong',
        toastType: ToastType.error,
      );
    } finally {
      isLoading = false;
    }
  }
}
