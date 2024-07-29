import 'package:fluttertoast/fluttertoast.dart';
import 'package:ecommerce/core/theme/theme.dart';

class Utils {
  static Future<void> showToast({
    required String message,
    required ToastType toastType,
  }) async {
    await Fluttertoast.showToast(
      msg: message,
      backgroundColor: toastType == ToastType.success
          ? AppColors.lightGreen
          : AppColors.lightRed,
    );
  }
}

enum ToastType {
  error,
  success,
}
