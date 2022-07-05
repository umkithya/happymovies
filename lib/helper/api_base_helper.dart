// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:get/get_connect.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

// import 'local_data/get_local_data.dart';

// class ApiBaseHelper extends GetConnect {
//   final String _baseUrl = dotenv.get('baseUrl');

//   Future<dynamic> fetchData(
//       {String? url,
//       Map<String, String>? header,
//       bool? isAuthorize = false,
//       bool? multipleparam = false}) async {
//     final _token = await LocalDataStorage.getCurrentUser();
//     // ignore: prefer_typing_uninitialized_variables
//     // final _token = await LocalDataStorage.getCurrentUser();
//     // final _session = await LocalDataStorage.getUserSession();
//     // ignore: prefer_typing_uninitialized_variables
//     final responseJson;
//     Map<String, String> _header = {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       if (isAuthorize == true && _token != '')
//         'Authorization': isAuthorize! ? 'Bearer $_token' : ""
//     };
//     try {
//       final response = await get(
//         _baseUrl + url!,
//         headers: header ?? _header,
//       );

//       responseJson = _returnResponse(response);
//       debugPrint("url $url");
//     } catch (e) {
//       return Future.error(e);
//     }
//     return responseJson;
//   }

//   Future<dynamic> putDatafile(
//       {required String url,
//       required FormData body,
//       Map<String, String>? header,
//       bool? isAuthorize = false}) async {
//     final _token = await LocalDataStorage.getCurrentUser();

//     // ignore: prefer_typing_uninitialized_variables
//     final responseJson;
//     Map<String, String> _header = {
//       'Content-Type': 'multipart/form-data',
//       'Accept': 'application/json',
//       if (isAuthorize == true && _token != '')
//         'Authorization': isAuthorize! ? 'Bearer $_token' : ""
//     };
//     final fullUrl = _baseUrl + url;
//     try {
//       // final form = FormData(body);

//       var response = await put(
//         fullUrl,
//         body,
//         headers: _header,
//       );
//       responseJson = _returnResponse(response);
//     } catch (e) {
//       return Future.error(e);
//     }
//     return responseJson;
//   }

//   Future<dynamic> postData(
//       {required String url,
//       required Map<dynamic, dynamic> body,
//       Map<String, String>? header,
//       bool? isAuthorize = false}) async {
//     final _token = await LocalDataStorage.getCurrentUser();
//     // ignore: prefer_typing_uninitialized_variables
//     final responseJson;
//     // ignore: unused_local_variable

//     final fullUrl = _baseUrl + url;
//     Map<String, String> _header = {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       if (isAuthorize == true && _token != '')
//         'Authorization': isAuthorize! ? 'Bearer $_token' : ""
//     };

//     try {
//       final response = await post(
//         fullUrl,
//         json.encode(body),
//         headers: header ?? _header,
//       );
//       responseJson = _returnResponse(response);
//     } catch (e) {
//       return Future.error(e);
//     }
//     return responseJson;
//   }

//   Future<dynamic> putData({
//     required String url,
//     required Map<dynamic, dynamic> body,
//     Map<String, String>? header,
//     bool? isAuthorize = false,
//   }) async {
//     // ignore: prefer_typing_uninitialized_variables
//     final responseJson;
//     // ignore: unused_local_variable
//     final _token = await LocalDataStorage.getCurrentUser();
//     final fullUrl = _baseUrl + url;
//     Map<String, String> _header = {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       if (isAuthorize == true && _token != '')
//         'Authorization': isAuthorize! ? 'Bearer $_token' : ""
//     };
//     try {
//       final response =
//           await put(fullUrl, json.encode(body), headers: header ?? _header);
//       responseJson = _returnResponse(response);
//     } catch (e) {
//       return Future.error(e);
//     }
//     return responseJson;
//   }

//   Future<dynamic> deleteData(
//       {required String url,
//       Map<String, String>? header,
//       bool? isAuthorize = false}) async {
//     // ignore: prefer_typing_uninitialized_variables
//     final responseJson;
//     final _token = await LocalDataStorage.getCurrentUser();
//     final fullUrl = _baseUrl + url;
//     Map<String, String> _header = {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       if (isAuthorize == true && _token != '')
//         'Authorization': isAuthorize! ? 'Bearer $_token' : ""
//     };

//     debugPrint("body $fullUrl ");

//     try {
//       final response = await delete(fullUrl, headers: header ?? _header);
//       responseJson = _returnResponse(response);
//     } catch (e) {
//       return Future.error(e);
//     }
//     return responseJson;
//   }

//   dynamic _returnResponse(Response response) {
//     switch (response.statusCode) {
//       case 200:
//         var responseJson = json.decode(response.bodyString!);
//         return responseJson;
//       case 201:
//         var responseJson = json.decode(response.bodyString!);
//         return responseJson;
//       case 202:
//         var responseJson = json.decode(response.bodyString!);
//         return responseJson;
//       case 400:
//         return Future.error(ErrorModel(
//             statusCode: response.statusCode,
//             bodyString: json.decode(response.bodyString!)));
//       case 401:
//       case 404:
//         return Future.error(ErrorModel(
//             statusCode: response.statusCode,
//             bodyString: json.decode(response.bodyString!)));
//       case 403:
//         return Future.error(ErrorModel(
//             statusCode: response.statusCode,
//             bodyString: json.decode(response.bodyString!)));
//       case 500:
//         return Future.error(ErrorModel(
//             statusCode: response.statusCode, bodyString: response.bodyString!));

//       default:
//         return Future.error(ErrorModel(
//             statusCode: response.statusCode,
//             bodyString: response.bodyString ?? 'Error'));
//     }
//   }
// }

// class ErrorModel {
//   final int? statusCode;
//   final dynamic bodyString;
//   const ErrorModel({this.statusCode, this.bodyString});
// }

// // Future<dynamic> fetchData(
// //     {String? url,
// //     Map<String, String>? header,
// //     bool? isAuthorize = false}) async {
// //   // ignore: prefer_typing_uninitialized_variables
// //   final _token = await LocalDataStorage.getCurrentUser();
// //   // ignore: prefer_typing_uninitialized_variables
// //   final responseJson;
// //   Map<String, String> _header = {
// //     'Content-Type': 'application/json',
// //     'Accept': 'application/json',
// //     'Authorization': isAuthorize! ? 'Bearer $_token' : ""
// //   };
// //   try {
// //     final response = await get(_baseUrl + url!, headers: header ?? _header);
// //     responseJson = _returnResponse(response);
// //   } catch (e) {
// //     return Future.error(e);
// //   }
// //   return responseJson;
// // }
// // Future<dynamic> putDatafile(
// //     {required String url,
// //     required FormData body,
// //     Map<String, String>? header,
// //     bool? isAuthorize = false}) async {
// //   final fullUrl = _baseUrl + url;
// //   final _token = await LocalDataStorage.getCurrentUser();
// //   final _session = await LocalDataStorage.getUserSession();
// //   // ignore: prefer_typing_uninitialized_variables
// //   final responseJson;
// //   Map<String, String> _header = {
// //     'Content-Type': 'multipart/form-data',
// //     'Accept': 'application/json',
// //     'Authorization': isAuthorize! ? 'Bearer $_token' : ""
// //   };
// //   try {
// //     // final form = FormData(body);

// //     var response = await put(
// //       fullUrl,
// //       body,
// //       headers: _header,
// //     );
// //     responseJson = _returnResponse(response);
// //   } catch (e) {
// //     return Future.error(e);
// //   }
// //   return responseJson;
// // }

// // Future<dynamic> postData(
// //     {required String url,
// //     required Map<dynamic, String> body,
// //     Map<String, String>? header,
// //     bool? isAuthorize = false}) async {
// //   final fullUrl = _baseUrl + url;
// //   // ignore: prefer_typing_uninitialized_variables
// //   final responseJson;
// //   // ignore: unused_local_variable
// //   final _token = await LocalDataStorage.getCurrentUser();
// //   final _session = await LocalDataStorage.getUserSession();
// //   Map<String, String> _header = {
// //     'Content-Type': 'application/json',
// //     'Accept': 'application/json',
// //     'Authorization': isAuthorize! ? 'Bearer $_token' : ""
// //   };
// //   try {
// //     final response =
// //         await post(fullUrl, json.encode(body), headers: header ?? _header);
// //     responseJson = _returnResponse(response);
// //   } catch (e) {
// //     return Future.error(e);
// //   }
// //   return responseJson;
// // }

// // Future<dynamic> putData({
// //   required String url,
// //   required Map<dynamic, String> body,
// //   Map<String, String>? header,
// //   bool? isAuthorize = false,
// // }) async {
// //   final fullUrl = _baseUrl + url;
// //   // ignore: prefer_typing_uninitialized_variables
// //   final responseJson;
// //   // ignore: unused_local_variable
// //   final _token = await LocalDataStorage.getCurrentUser();
// //   final _session = await LocalDataStorage.getUserSession();
// //   Map<String, String> _header = {
// //     'Content-Type': 'application/json',
// //     'Accept': 'application/json',
// //     'Authorization': isAuthorize! ? 'Bearer  $_token' : ""
// //   };
// //   try {
// //     final response =
// //         await put(fullUrl, json.encode(body), headers: header ?? _header);
// //     responseJson = _returnResponse(response);
// //   } catch (e) {
// //     return Future.error(e);
// //   }
// //   return responseJson;
// // }

// // Future<dynamic> deleteData(
// //     {required String url,
// //     Map<String, String>? header,
// //     bool? isAuthorize = false}) async {
// //   final fullUrl = _baseUrl + url;
// //   // ignore: prefer_typing_uninitialized_variables
// //   final responseJson;
// //   final _token = await LocalDataStorage.getCurrentUser();
// //   final _session = await LocalDataStorage.getUserSession();
// //   Map<String, String> _header = {
// //     'Content-Type': 'application/json',
// //     'Accept': 'application/json',
// //     'Authorization': isAuthorize! ? 'Bearer  $_token' : ""
// //   };
// //   try {
// //     final response = await delete(fullUrl, headers: header ?? _header);
// //     responseJson = _returnResponse(response);
// //   } catch (e) {
// //     return Future.error(e);
// //   }
// //   return responseJson;
// // }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_connect.dart';

class ErrorModel {
  final int? statusCode;
  final dynamic bodyString;
  const ErrorModel({this.statusCode, this.bodyString});
}

enum METHODE {
  get,
  post,
  delete,
  update,
}

class ApiBaseHelper extends GetConnect {
  final String? baseurl = dotenv.get('baseUrl');
  Future<dynamic> onNetworkRequesting({
    required String url,
    Map<String, String>? header,
    Map<String, dynamic>? body,
    required METHODE? methode,
    required bool isAuthorize,
    bool isConvertToByte = false,
  }) async {
    const token =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjQ3NDA0OTc1LCJpYXQiOjE2NDY4MDAxNzUsImp0aSI6IjIzNGViZjMwMTU0YTRjZGQ4MmFlNGIxMzU4NmY2YWNlIiwidXNlcl9pZCI6OTR9.Qg0TjHTMJ35FhPFkXsQEuX9Lln2uj4FNs6ujW3VFlmI";
    // await LocalStorage.getLocalData('token');
    final fullUrl = baseurl! + url;
    debugPrint("url======================== $fullUrl");
    Map<String, String> _header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': isAuthorize ? 'Bearer $token' : ""
    };

    try {
      switch (methode) {
        case METHODE.get:
          final response = await get(fullUrl, headers: header ?? _header);
          return _returnResponse(response, isConvertToByte);
        case METHODE.post:
          if (body != null) {
            final response = await post(fullUrl, json.encode(body),
                headers: header ?? _header);
            return _returnResponse(response, isConvertToByte);
          }
          return Future.error(
              const ErrorModel(bodyString: 'Body must be included'));

        case METHODE.delete:
          final response = await delete(fullUrl, headers: header ?? _header);
          return _returnResponse(response, isConvertToByte);
        case METHODE.update:
          if (body != null) {
            final response = await put(fullUrl, json.encode(body),
                headers: header ?? _header);
            return _returnResponse(response, isConvertToByte);
          }
          return Future.error(
              const ErrorModel(bodyString: 'Body must be included'));

        default:
          break;
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  dynamic _returnResponse(Response response, bool isReturnBytes) {
    switch (response.statusCode) {
      case 200:
        var responseJson = isReturnBytes
            ? response.bodyBytes
            : json.decode(response.bodyString!);
        return responseJson;
      case 201:
        var responseJson = isReturnBytes
            ? response.bodyBytes
            : json.decode(response.bodyString!);
        return responseJson;
      case 202:
        var responseJson = isReturnBytes
            ? response.bodyBytes
            : json.decode(response.bodyString!);
        return responseJson;
      case 404:
        return Future.error(ErrorModel(
            statusCode: response.statusCode,
            bodyString: json.decode(response.bodyString!)));
      case 400:
        return Future.error(ErrorModel(
            statusCode: response.statusCode,
            bodyString: json.decode(response.bodyString!)));
      case 401:
        return Future.error(ErrorModel(
            statusCode: response.statusCode,
            bodyString: json.decode(response.bodyString!)));
      case 403:
        return Future.error(ErrorModel(
            statusCode: response.statusCode,
            bodyString: json.decode(response.bodyString!)));
      case 500:
        break;
      default:
        return Future.error(ErrorModel(
            statusCode: response.statusCode,
            bodyString: json.decode(response.bodyString!)));
    }
  }
}
