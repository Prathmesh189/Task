import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../controllers/app_controller.dart';
import '../utils/config.dart';
import 'api_exception.dart';

class APIManager {
  static late AppController _appController;
  static late APIManager _apiManager;
  factory APIManager.init(AppController appController) {
    _appController = appController;
    _apiManager = APIManager._internal();
    return _apiManager;
  }

  factory APIManager() {
    return _apiManager;
  }

  static CancelToken cancelToken = CancelToken();

  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      baseUrl: Config.domainUrl,
    ),
  );

  APIManager._internal() {
    // Add Interceptors for common tasks (authentication, caching, etc.)
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers['Content-Type'] = 'application/json';
          if (getAuthToken.isNotEmpty)
            options.headers['Authorization'] =
                'Bearer yJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjozLCJpYXQiOjE3MjY3Mzk3MzIsImV4cCI6MTc1ODI3NTczMn0.12s9mY9zh0yNlEA2UD4zFvr_uE4_RzK9pqqbumS5IsA';
          return handler.next(options);
        },
      ),
    );
  }

  // Function to check & return if the token is valid
  String get getAuthToken {
    return _appController.userToken ?? '';
  }

  // GET
  Future<dynamic> getAPICall({
    required String url,
    Map<String, dynamic>? queryParameters,
    bool showLoading = true,
    int timeOut = 20,
  }) async {
    // Check internet is on or not
    if (_appController.connection.hasInternet) {
      // if (showLoading) Loader.instance.showLoader();
      try {
        debugPrint('------------------ $url');
        final response = await _dio
            .get(
          url,
          queryParameters: queryParameters,
          cancelToken: cancelToken,
        )
            .timeout(
          Duration(seconds: timeOut),
          onTimeout: () {
            throw TimeoutException(message: 'Timeout');
          },
        );
        logAPICallDetails(response);
        var responseJson = _response(response);
        return responseJson;
      } on TimeoutException {
        handleTimeoutException();
        return null;
      } on DioException catch (error) {
        handleDioError(error);
        return null;
      } finally {
        debugPrint('finally');
        // Loader.instance.removeLoader();
      }
    } else {
      handleNoInternet();
      return null;
    }
  }

  // POST
  Future<dynamic> postAPICall({
    required String url,
    required var params,
    Map<String, dynamic>? queryParameters,
    bool showLoading = true,
    int timeOut = 20,
  }) async {
    // Check internet is on or not
    if (_appController.connection.hasInternet) {
      // if (showLoading) Loader.instance.showLoader();
      debugPrint('------------------ $url');
      try {
        final response = await _dio
            .post(
          url,
          data: params,
          queryParameters: queryParameters,
          // options: Options(
          //   headers: {'Content-Type': 'application/json'},
          // ),
          cancelToken: cancelToken,
        )
            .timeout(
          Duration(seconds: timeOut),
          onTimeout: () {
            throw TimeoutException(message: 'Timeout');
          },
        );
        logAPICallDetails(response);
        var responseJson = _response(response);
        return responseJson;
      } on TimeoutException {
        handleTimeoutException();
        return null;
      } on DioException catch (error) {
        handleDioError(error);
        return null;
      } finally {
        // if (showLoading) Loader.instance.removeLoader();
      }
    } else {
      handleNoInternet();
      return null;
    }
  }

  // PUT
  Future<dynamic> putAPICall({
    required String url,
    required var params,
    Map<String, dynamic>? queryParameters,
    bool showLoading = true,
    int timeOut = 20,
  }) async {
    // Check internet is on or not
    if (_appController.connection.hasInternet) {
      // showLoaderIfNeeded(showLoading);
      try {
        final response = await _dio
            .put(
          url,
          data: params,
          queryParameters: queryParameters,
          options: Options(
            headers: {'Content-Type': 'application/json'},
          ),
          cancelToken: cancelToken,
        )
            .timeout(
          Duration(seconds: timeOut),
          onTimeout: () {
            throw TimeoutException(message: 'Timeout');
          },
        );
        logAPICallDetails(response);
        var responseJson = _response(response);
        return responseJson;
      } on TimeoutException {
        handleTimeoutException();
        return null;
      } on DioException catch (error) {
        handleDioError(error);
        return null;
      } finally {
        debugPrint('finally');
        // Loader.instance.removeLoader();
      }
    } else {
      handleNoInternet();
      return null;
    }
  }

  // PATCH
  Future<dynamic> patchAPICall({
    required String url,
    required var params,
    Map<String, dynamic>? queryParameters,
    bool showLoading = true,
    int timeOut = 20,
  }) async {
    // Check internet is on or not
    if (_appController.connection.hasInternet) {
      // showLoaderIfNeeded(showLoading);
      try {
        final response = await _dio
            .patch(
          url,
          data: params,
          queryParameters: queryParameters,
          // options: Options(
          //   headers: {'Content-Type': 'application/json'},
          // ),
          cancelToken: cancelToken,
        )
            .timeout(
          Duration(seconds: timeOut),
          onTimeout: () {
            throw TimeoutException(message: 'Timeout');
          },
        );
        logAPICallDetails(response);
        var responseJson = _response(response);
        return responseJson;
      } on TimeoutException {
        handleTimeoutException();
        return null;
      } on DioException catch (error) {
        handleDioError(error);
        return null;
      } finally {
        debugPrint('finally');
        // Loader.instance.removeLoader();
      }
    } else {
      handleNoInternet();
      return null;
    }
  }

  // Delete
  Future<dynamic> deleteAPICall({
    required String url,
    Map<String, dynamic>? params,
    Map<String, dynamic>? queryParameters,
    bool showLoading = true,
    int timeOut = 20,
  }) async {
    // Check if internet is available
    if (_appController.connection.hasInternet) {
      try {
        final response = await _dio
            .delete(
          url,
          data: params,
          queryParameters: queryParameters,
          cancelToken: cancelToken,
        )
            .timeout(
          Duration(seconds: timeOut),
          onTimeout: () {
            throw TimeoutException(message: 'Timeout');
          },
        );

        logAPICallDetails(response);

        var responseJson = _response(response);
        return responseJson;
      } on TimeoutException {
        handleTimeoutException();
        return null;
      } on DioException catch (error) {
        handleDioError(error);
        return null;
      } finally {
        debugPrint('finally');
        // Loader.instance.removeLoader();
      }
    } else {
      handleNoInternet();
      return null;
    }
  }

  // MULTIPART POST API call
  Future<dynamic> multipartPostAPICall(
      {required String url,
      String? fileKey,
      File? file,
      required Map<String, dynamic> params,
      Map<String, dynamic>? queryParameters,
      bool showLoading = true,
      int timeOut = 60}) async {
    // Check internet is on or not
    if (_appController.connection.hasInternet) {
      // Loader.instance.showLoader();
      // showLoaderIfNeeded(showLoading);
      try {
        final formData = FormData.fromMap({
          ...params,
          if (fileKey != null && file != null) fileKey: await MultipartFile.fromFile(file.path, filename: file.path.split('/').last),
        });
        final response = await _dio
            .post(
          url,
          data: formData,
          queryParameters: queryParameters,
          options: Options(
            headers: {'Content-Type': 'multipart/form-data'},
          ),
          cancelToken: cancelToken,
        )
            .timeout(
          Duration(seconds: timeOut),
          onTimeout: () {
            throw TimeoutException(message: 'Timeout');
          },
        );
        var responseJson = _response(response);
        logAPICallDetails(response);
        return responseJson;
      } on TimeoutException {
        handleTimeoutException();
      } on DioException catch (error) {
        handleDioError(error);
      } finally {
        // Loader.instance.removeLoader();
      }
    }

    return null;
  }

  //MULTIPART PUT API call
  Future<dynamic> multipartPutAPICall(
      {required String url,
      String? fileKey,
      File? file,
      required Map<String, dynamic> params,
      Map<String, dynamic>? queryParameters,
      bool showLoading = true,
      int timeOut = 60}) async {
    // Check internet is on or not
    if (_appController.connection.hasInternet) {
      // Loader.instance.showLoader();
      // showLoaderIfNeeded(showLoading);
      try {
        final formData = FormData.fromMap({
          ...params,
          if (fileKey != null && file != null) fileKey: await MultipartFile.fromFile(file.path, filename: file.path.split('/').last),
        });
        final response = await _dio
            .put(
          url,
          data: formData,
          queryParameters: queryParameters,
          options: Options(
            headers: {'Content-Type': 'multipart/form-data'},
          ),
          cancelToken: cancelToken,
        )
            .timeout(
          Duration(seconds: timeOut),
          onTimeout: () {
            throw TimeoutException(message: 'Timeout');
          },
        );
        var responseJson = _response(response);
        logAPICallDetails(response);
        return responseJson;
      } on TimeoutException {
        handleTimeoutException();
      } on DioException catch (error) {
        handleDioError(error);
      } finally {
        // Loader.instance.removeLoader();
      }
    }

    return null;
  }

  // Multipart Patch API call
  Future<dynamic> multipartPatchAPICall(
      {required String url,
      Map<String, File?>? files,
      required Map<String, dynamic> params,
      Map<String, dynamic>? queryParameters,
      bool showLoading = true,
      int timeOut = 60}) async {
    if (_appController.connection.hasInternet) {
      // Loader.instance.showLoader();
      try {
        final formData = FormData.fromMap({
          ...params,
          if (files != null) ...{
            for (var entry in files.entries)
              if (entry.value != null)
                entry.key: await MultipartFile.fromFile(entry.value!.path, filename: entry.value!.path.split('/').last),
          },
        });
        final response = await _dio
            .patch(
          url,
          data: formData,
          queryParameters: queryParameters,
          options: Options(
            headers: {'Content-Type': 'multipart/form-data'},
          ),
          cancelToken: cancelToken,
        )
            .timeout(
          Duration(seconds: timeOut),
          onTimeout: () {
            throw TimeoutException(message: 'Timeout');
          },
        );
        var responseJson = _response(response);
        logAPICallDetails(response);
        return responseJson;
      } on TimeoutException {
        handleTimeoutException();
      } on DioException catch (error) {
        handleDioError(error);
      } finally {
        // Loader.instance.removeLoader();
      }
    }
    return null;
  }

  // Multpart post api call for multiple files
  Future<dynamic> multipartPostMultiFilesAPICall(
      {required String url,
      Map<String, File?>? files,
      required Map<String, dynamic> params,
      Map<String, dynamic>? queryParameters,
      bool showLoading = true,
      int timeOut = 60}) async {
    if (_appController.connection.hasInternet) {
      // Loader.instance.showLoader();
      try {
        final formData = FormData.fromMap({
          ...params,
          if (files != null) ...{
            for (var entry in files.entries)
              if (entry.value != null)
                entry.key: await MultipartFile.fromFile(entry.value!.path, filename: entry.value!.path.split('/').last),
          },
        });
        final response = await _dio
            .post(
          url,
          data: formData,
          queryParameters: queryParameters,
          options: Options(
            headers: {'Content-Type': 'multipart/form-data'},
          ),
          cancelToken: cancelToken,
        )
            .timeout(
          Duration(seconds: timeOut),
          onTimeout: () {
            throw TimeoutException(message: 'Timeout');
          },
        );
        var responseJson = _response(response);
        logAPICallDetails(response);
        return responseJson;
      } on TimeoutException {
        handleTimeoutException();
      } on DioException catch (error) {
        handleDioError(error);
      } finally {
        // Loader.instance.removeLoader();
      }
    }
    return null;
  }

  // Function to cancel any ongoing requests
  void cancelRequests() {
    cancelToken.cancel();
    cancelToken = CancelToken(); // Reset the cancel token for future requests
  }

  void handleNoInternet() {
    //   if (isNoInternetMessageDisplayed == false) {
    //     // errorSnackBar(message: noInternetMsg);
    //     isNoInternetMessageDisplayed = true;
    //   }
  }

  void handleSessionExpired() {
    // if (isSessionExpiredMessageDisplayed == false) {
    //   // errorSnackBar(message: 'Your session has expired!');
    //   isSessionExpiredMessageDisplayed = true;
    // }
  }

  void handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        handleTimeoutException();
        break;
      case DioExceptionType.sendTimeout:
        handleTimeoutException();
        break;
      case DioExceptionType.receiveTimeout:
        handleTimeoutException();
        break;
      case DioExceptionType.badResponse:
        if (error.response != null) {
          switch (error.response?.statusCode) {
            case 400:
              handleBadRequest(error.response!.data);
              break;
            case 401:
              handleUnauthorized(error.response!.data);
              break;
            case 403:
              handleForbidden(error.response!.data);
              break;
            case 404:
              handleNotFound(error.response!.statusMessage ?? '');
              break;
            default:
              handleGenericBadResponse(error.response!.statusCode, error.response!.data);
          }
        } else {
          throw FetchDataException('Received invalid status code: ${error.response?.statusCode}');
        }
        break;
      case DioExceptionType.cancel:
        // errorSnackBar(message: 'Request to API server was cancelled');
        throw FetchDataException('Request to API server was cancelled');
      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          // errorSnackBar(message: 'No Internet connection');
          throw FetchDataException('No Internet connection');
        } else {
          // errorSnackBar(message: 'Unexpected error occurred');
          throw FetchDataException('Unexpected error occurred');
        }
      default:
        handleGenericError(error, error.stackTrace);
        break;
    }
  }

  void handleTimeoutException() {
    throw TimeoutException(message: 'Timeout');
  }

  void handleBadRequest(dynamic data) {
    final message = data is Map<String, dynamic> && data.containsKey('message') ? data['message'] : data;
    // errorSnackBar(message: '$message');
    throw BadRequestException(message, 400);
  }

  void handleUnauthorized(dynamic data) {
    final message = data is Map<String, dynamic> && data.containsKey('message') ? data['message'] : data;
    // errorSnackBar(message: '$message');
    throw UnauthorizedException(message, 401);
  }

  void handleForbidden(dynamic data) {
    final message = data is Map<String, dynamic> && data.containsKey('message') ? data['message'] : data;
    // errorSnackBar(message: '$message');
    throw UnauthorizedException(message, 403);
  }

  void handleNotFound(String message) {
    // errorSnackBar(message: message);
    throw FetchDataException(message, 404);
  }

  void handleGenericBadResponse(int? statusCode, dynamic data) {
    // errorSnackBar(message: 'Received invalid status code: $statusCode');
    log('\x1B[91m[Error Response ($statusCode)] => $data\x1B[0m');
    throw FetchDataException('Received invalid status code: $statusCode');
  }

  void handleGenericError(error, StackTrace stackTrace) {
    if (error.toString().contains('Connection closed while receiving data')) {
      // errorSnackBar(message: 'An error occurred while communicating with the server');
    } else if (error.toString().contains('Connection closed before full header was received')) {
      log('\x1B[91m[Handle Generic Error] => Request Canceled\x1B[0m');
    } else {
      // errorSnackBar(message: 'Server error');
    }
    throw FetchDataException('Server Error');
  }

  dynamic _response(Response response) async {
    switch (response.statusCode) {
      // Successfully get api response
      case 200:
      case 201:
      case 202:
        return response.data;
      // No content
      case 204:
        log('\x1B[91m[No Content (204)] => ${response.data}\x1B[0m');
        return;
      // Bad request need to check url
      case 400:
        handleBadRequest(response.data);
        break;
      // Unauthorized
      case 401:
        handleUnauthorized(response.data);
        break;
      // Authorisation token invalid
      case 403:
        handleForbidden(response.data);
        break;
      // Not Found
      case 404:
        log('\x1B[91m[Not Found (404)] => ${response.data}\x1B[0m');
        break;
      // Conflict
      case 409:
        log('\x1B[91m[Conflict (409)] => ${response.data}\x1B[0m');
        break;
      // Error occurred while communication with server
      case 500:
      default:
        // errorSnackBar(message: 'An error occurred while communicating to server with status code: ${response.statusCode}');
        log('\x1B[91m[Internal Server Error (${response.statusCode})] => ${response.data}\x1B[0m');
        throw FetchDataException('Error occurred with code : ${response.statusCode}');
    }
  }

  // Helper function to log API call details
  void logAPICallDetails(Response response) {
    log('\x1B[90m<--------------------------- [API CALL] --------------------------->\x1B[0m');
    log('\x1B[94m[Method] => \x1B[95m${response.requestOptions.method}\x1B[0m');
    log('\x1B[94m[Headers] => \x1B[95m${response.requestOptions.headers}\x1B[0m');
    log('\x1B[94m[Url] => \x1B[95m${response.requestOptions.uri}\x1B[0m');
    if (response.requestOptions.method == 'POST' || response.requestOptions.method == 'PUT') {
      var data = response.requestOptions.data;
      if (data is FormData) {
        log('\x1B[94m[Body] => \x1B[95mFormData\x1B[0m');
        for (var element in data.fields) {
          log('\x1B[94m[${element.key}] => \x1B[95m${element.value}\x1B[0m');
        }
        for (var element in data.files) {
          log('\x1B[94m[${element.key}] => \x1B[95m${element.value.filename}\x1B[0m');
        }
      } else {
        log('\x1B[94m[Body] => \x1B[95m${json.encode(data)}\x1B[0m');
      }
    }
    if (response.statusCode != null && (response.statusCode! - 200) < 10) {
      log('\x1B[94m[Response (${response.statusCode})] => \x1B[96m$response\x1B[0m');
    }
  }
}
