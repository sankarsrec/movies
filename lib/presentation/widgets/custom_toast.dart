import 'package:fluttertoast/fluttertoast.dart';

import '../../utils/app_colors.dart';

class CustomToast {
  static show({
    required String title,
    String description = '',
    bool isError = false,
  }) {
    Fluttertoast.showToast(
      msg: title,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: isError ? AppColors.red : AppColors.grey,
      textColor: AppColors.white,
      fontSize: 16.0,
    );
  }
}
