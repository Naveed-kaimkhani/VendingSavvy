
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
    return await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
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

  Future<http.Response> put({
    required String url,
    Object? body,
    Map<String, String>? headers,
  }) async {
    return await http.put(Uri.parse(url), body: body, headers: headers);
  }

  Future<http.Response> login({required String url, Object? body}) async {
    return await http.post(Uri.parse(url), body: body);
  }

  Future<http.Response> signup({required String url, Object? body}) async {
    return await http.post(Uri.parse(url), body: body);
  }
}
