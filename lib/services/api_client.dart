import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../controllers/user_controller.dart';

class ApiClient extends GetxService {
  final UserController userController = Get.find<UserController>();

  Future<http.Response> post({required String url, Object? body}) async {
    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${userController.token.value}",
    };
    return await http.post(Uri.parse(url), headers: headers, body: body);
  }

  Future<http.Response> get({required String url}) async {
    final headers = {
      "Authorization": "Bearer ${userController.token.value}",
      "Accept": "application/json",
    };
    return await http.get(Uri.parse(url), headers: headers);
  }

  Future<http.Response> delete({required String url, Object? body}) async {
    return await http.delete(Uri.parse(url), body: body);
  }

  // Future<http.Response> put({
  //   required String url,
  //   Object? body,
  // }) async {
  //   final headers = {
  //     "Authorization": "Bearer ${userController.token.value}",
  //     "Accept": "application/json",
  //   };
  //   return await http.put(Uri.parse(url), body: body, headers: headers);
  // }

  Future<http.Response> login({required String url, Object? body}) async {
    return await http.post(Uri.parse(url), body: body);
  }
  Future<http.Response> put({
  required String url,
  required Map<String, dynamic>? body,
}) async {
  final headers = {
    "Authorization": "Bearer ${userController.token.value}",
    "Accept": "application/json",
    "Content-Type": "application/json", // ✅ Add this header
  };
  
  http.Response response;
  if (body != null) {
    final jsonBody = jsonEncode(body);
    response = await http.put(
      Uri.parse(url), 
      headers: headers, 
      body: jsonBody
    );
  } else {
    response = await http.put(
      Uri.parse(url), 
      headers: headers,
    );
  }
  
  return response;
}

  Future<http.Response> signup({required String url, Object? body}) async {
    return await http.post(Uri.parse(url), body: body);
  }



  
  /////////post images methods
  Future<http.Response> postImagesToServer({
    required String endPoint,
    required Map<String, String> data,
    required Map<String, dynamic> files,
  }) async {
    try {
      // final prefs = await SharedPreferences.getInstance();
      // String? token = prefs.getString('token');

      var request = http.MultipartRequest('POST', Uri.parse(endPoint));

      request.headers['Authorization'] =
          "Bearer ${userController.token.value}";
      for (var entry in files.entries) {
        String key = entry.key;
        dynamic value = entry.value;

        if (value is List<File?>) {
          for (var file in value.where((file) => file != null).cast<File>()) {
            request.files.add(
              await http.MultipartFile.fromPath(key, file.path),
            );
          }
        } else if (value is File?) {
          if (value != null) {
            request.files.add(
              await http.MultipartFile.fromPath(key, value.path),
            );
          }
        }
      }

      request.fields.addAll(data);

      var response = await request.send();
      return http.Response.fromStream(response);
    } catch (e) {
      rethrow;
    }
  }
}
