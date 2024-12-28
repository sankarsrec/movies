import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:movies/data/models/server_error_model.dart';

import '../../dependency_injection/dependency_injection.dart';
import '../../domain/use_cases/local/local_use_case.dart';
import 'api_constants.dart';
import 'app_exceptions.dart';

class ApiServices {
  final BaseOptions _options = BaseOptions(
    baseUrl: ApiConstants.baseURL,
  );

  dynamic get(
    String path, {
    Map<String, dynamic>? queryParameters,
    bool hideError = false,
  }) async {
    _options.headers = await getHeader();
    final dio = Dio(_options);
    try {
      bool isConnected = await checkInternetConnection();
      if (isConnected) {
        final response = await dio.get(
          getPath(path, queryParameters),
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          return response.data;
        } else {
          return ServerErrorModel.fromJson(response.data);
        }
      } else {
        return const ServerErrorModel(
          message: '',
        );
      }
    } catch (exception) {
      return ServerErrorModel(
        message: hideError ? '' : AppExceptions.handleException(exception),
      );
    }
  }

  dynamic post(
    String path, {
    dynamic params,
    dio.FormData? formData,
    Map<String, dynamic>? queryParameters,
  }) async {
    _options.headers = await getHeader();
    final dio = Dio(_options);
    try {
      bool isConnected = await checkInternetConnection();
      if (isConnected) {
        final response = await dio.post(
          path,
          data: formData ?? jsonEncode(params ?? {}),
          queryParameters: queryParameters,
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          return response.data;
        } else {
          return ServerErrorModel.fromJson(response.data);
        }
      } else {
        return const ServerErrorModel(
          message: '',
        );
      }
    } catch (exception) {
      return ServerErrorModel(
        message: AppExceptions.handleException(exception),
      );
    }
  }

  dynamic put(
    String path, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? queryParameters,
  }) async {
    _options.headers = await getHeader();
    final dio = Dio(_options);
    try {
      bool isConnected = await checkInternetConnection();
      if (isConnected) {
        final response = await dio.put(
          getPath(path, queryParameters),
          data: jsonEncode(params ?? {}),
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          return response.data;
        } else {
          return ServerErrorModel.fromJson(response.data);
        }
      } else {
        return const ServerErrorModel(
          message: '',
        );
      }
    } catch (exception) {
      return ServerErrorModel(
        message: AppExceptions.handleException(exception),
      );
    }
  }

  dynamic patch(
    String path, {
    dynamic params,
    dio.FormData? formData,
    Map<String, dynamic>? queryParameters,
  }) async {
    _options.headers = await getHeader();
    final dio = Dio(_options);
    try {
      bool isConnected = await checkInternetConnection();
      if (isConnected) {
        final response = await dio.patch(
          path,
          data: formData ?? jsonEncode(params ?? {}),
          queryParameters: queryParameters,
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          return response.data;
        } else {
          return ServerErrorModel.fromJson(response.data);
        }
      } else {
        return const ServerErrorModel(
          message: '',
        );
      }
    } catch (exception) {
      return ServerErrorModel(
        message: AppExceptions.handleException(exception),
      );
    }
  }

  Future<Map<String, dynamic>> getHeader() async {
    Map<String, String> header = <String, String>{};
    // String authToken = await getAuthToken();
    // if (authToken.isNotEmpty) {
    //   header.putIfAbsent(ApiConstants.authorization, () => authToken);
    // }

    header.putIfAbsent(
      ApiConstants.host,
      () => ApiConstants.hostValue,
    );

    header.putIfAbsent(
      ApiConstants.key,
      () => ApiConstants.apiKey,
    );
    return header;
  }

  String getPath(String path, Map<dynamic, dynamic>? params) {
    String paramsString = '';
    if (params?.isNotEmpty ?? false) {
      int count = 0;
      params?.forEach((key, value) {
        if (count == 0) {
          paramsString = '$key=$value';
        } else {
          paramsString += '&$key=$value';
        }
        count++;
      });
    }
    return '${ApiConstants.baseURL}$path?$paramsString';
  }

  Future<String> getAuthToken() async {
    String authToken = getItInstance<LocalUseCase>().getAccessToken() ?? '';
    return authToken;
  }

  static Future<bool> checkInternetConnection() async {
    bool isConnected = false;
    try {
      List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile)) {
        isConnected = true;
      } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
        isConnected = true;
      } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
        isConnected = true;
      } else if (connectivityResult.contains(ConnectivityResult.vpn)) {
        isConnected = true;
      } else if (connectivityResult.contains(ConnectivityResult.other)) {
        isConnected = true;
      } else {
        isConnected = false;
      }
    } catch (exception) {
      isConnected = false;
    }
    return isConnected;
  }
}
