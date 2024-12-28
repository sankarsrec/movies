import 'package:dio/dio.dart';

import '../../domain/entities/error_entity.dart';
import '../../presentation/widgets/custom_toast.dart';
import '../../utils/app_constants.dart';

enum AppErrorType {
  error,
  api,
  network,
  localStorage,
  invalidToken,
}

class AppExceptions {
  static throwError({
    required ErrorEntity errorEntity,
  }) async {
    String message = '';
    String description = '';

    if (errorEntity.appErrorType == AppErrorType.network) {
      message = AppConstants.networkErrorMessage;
      description = AppConstants.networkErrorDescription;
    } else {
      if (errorEntity.appErrorType == AppErrorType.api ||
          errorEntity.appErrorType == AppErrorType.localStorage) {
        message = AppConstants.error;
        description = AppConstants.errorDescription;
      } else if (errorEntity.appErrorType == AppErrorType.error) {
        message = errorEntity.exception != null && errorEntity.error != null
            ? ((errorEntity.error?.isNotEmpty ?? false)
                ? errorEntity.error ?? errorEntity.exception.toString()
                : ((errorEntity.exception?.error is String
                        ? errorEntity.exception?.error
                        : errorEntity.exception?.error?.message) ??
                    errorEntity.exception.toString()))
            : errorEntity.error ?? AppConstants.error;
        description = errorEntity.description ?? '';
      }

      message = description.isNotEmpty ? description : message;
      description = '';
    }
    CustomToast.show(
      title: message,
      description: description,
      isError: true,
    );
  }

  static String handleException(exception) {
    String errorMessage = '';
    String errorDescription = '';

    if (exception is DioException) {
      if (exception.type == DioExceptionType.badResponse) {
        try {
          errorDescription = exception.response?.data is Map
              ? (exception.response?.data['message'] ??
                  exception.response?.data['error'] ??
                  '')
              : '';
        } catch (catchException) {
          errorDescription = '';
        }
      }
      errorMessage = exception.response?.statusMessage ??
          (exception.response?.data is Map
              ? (exception.response?.data['message'] ??
                  exception.response?.data['error'] ??
                  '')
              : '');
      throwError(
        errorEntity: ErrorEntity(
          error: errorMessage,
          appErrorType: AppErrorType.error,
          exception: exception,
          description: errorDescription,
        ),
      );
    } else if (exception.toString().contains('SocketException')) {
      throwError(
        errorEntity: const ErrorEntity(
          appErrorType: AppErrorType.network,
        ),
      );
    } else {
      throwError(
        errorEntity: ErrorEntity(
          appErrorType: AppErrorType.error,
          description: exception.toString(),
        ),
      );
    }

    return errorMessage;
  }
}
