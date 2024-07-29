import 'package:ecommerce/core/firebase/firestore/firestore_handler.dart';
import 'package:ecommerce/core/firebase/login/firebase_login.dart';
import 'package:ecommerce/core/firebase/remote_config/remote_config_handler.dart';
import 'package:ecommerce/core/local_storage/i_local_storage.dart';
import 'package:ecommerce/core/network_handler/i_network_handler.dart';

import 'package:get_it/get_it.dart';

export 'package:ecommerce/core/local_storage/i_local_storage.dart';
export 'package:ecommerce/core/firebase/login/firebase_login.dart';
export 'package:ecommerce/core/firebase/remote_config/remote_config_handler.dart';
export 'package:ecommerce/core/firebase/firestore/firestore_handler.dart';
export 'package:ecommerce/core/network_handler/i_network_handler.dart';

final GetIt getIt = GetIt.instance;

void registerDi() {
  getIt.registerLazySingleton<RemoteConfigHandler>(
    () => RemoteConfigHandler(),
  );

  getIt.registerLazySingleton<LocalStorage>(
    () => LocalStorage(),
  );

  getIt.registerLazySingleton<FirebaseLogin>(
    () => FirebaseLogin(),
  );

  getIt.registerLazySingleton<FirestoreHandler>(
    () => FirestoreHandler(),
  );

  getIt.registerLazySingleton<NetworkCalls>(
    () => NetworkCalls(),
  );
}

Future<void> initializeServices() async {
  await Future.wait([
    getIt<RemoteConfigHandler>().init(),
    getIt<LocalStorage>().init(),
  ]);
}
