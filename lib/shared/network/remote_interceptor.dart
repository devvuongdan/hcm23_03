import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hcm23_03/shared/app_singletons.dart';
import 'package:hcm23_03/shared/constants.dart';

class RemoteInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.extra["requestTime"] = DateTime.now();
    try {
      final enableLoading = options.headers[AppConstants.enableLoading] ?? true;
      if (enableLoading && !NetworkSingletonImpl.shared.isShowingLoading$) {
        // Todo: Implement Loading.show();
      }

      // Trans to extra
      // options.extra[AppConstants.isShowDefaultErrorDialog] =
      //     options.headers[AppConstants.isShowDefaultErrorDialog];
      // options.extra[AppConstants.whitelistErrorCode] =
      //     options.headers[AppConstants.whitelistErrorCode];
      // options.extra[AppConstants.isShowDefaultDioErrorDialog] =
      //     options.headers[AppConstants.isShowDefaultDioErrorDialog];

      // remove header keys
      options.headers.remove(AppConstants.enableLoading);
      // options.headers.remove(AppConstants.isShowDefaultErrorDialog);
      // options.headers.remove(AppConstants.whitelistErrorCode);
      // options.headers.remove(AppConstants.isShowDefaultDioErrorDialog);
    } catch (e) {
      print(
        "🔗 REQUEST: ${options.method} - ${options.uri}\nHeader: ${options.headers}\nBody: ${json.encode(options.data ?? '')}",
      );
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    try {
      final enableLoading =
          response.requestOptions.extra[AppConstants.enableLoading] ?? true;
      if (enableLoading && NetworkSingletonImpl.shared.isShowingLoading$) {
        // Todo: Implement Loading.hide();
        NetworkSingletonImpl.shared.isLoading = false;
      }
    } catch (e) {
      print(
        "🔗 RESPONSE: ${response.requestOptions.method} - ${response.requestOptions.uri}\nStatus code: ${response.statusCode}\nResponse: ${json.encode(response.data ?? '')}",
      );
      super.onResponse(response, handler);
    }
  }

  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    try {
      final enableLoading =
          err.requestOptions.extra[AppConstants.enableLoading] ?? true;
      if (enableLoading && NetworkSingletonImpl.shared.isShowingLoading$) {
        // Todo: Implement Loading.hide();
        NetworkSingletonImpl.shared.isLoading = false;
      }
    } catch (e) {
      print(
        "🔗 ERROR: ${err.requestOptions.method} - ${err.requestOptions.uri}\nError: ${err.error}\nStackTrace: ${err.stackTrace}\nResponse: ${json.encode(err.response?.data ?? '')}",
      );
      super.onError(err, handler);
    }
  }
}
