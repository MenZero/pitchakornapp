import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pitchakornapp/models/user_model.dart';

class AppService {
  Future<void> checkLogin({
    required String username,
    required String password,
    required BuildContext context,
  }) async {
    try {
      String urlAPI = 'https://tns.nso.go.th/hh70/API/authenticate.php';

      Map<String, dynamic> body = {};
      body['username'] = username;
      body['password'] = password;

      Dio objectDio = Dio();
      objectDio.options.headers['Content-Type'] = 'multipart/form-data';

      var response = await objectDio.post(urlAPI, data: FormData.fromMap(body));

      debugPrint('response ===> ${response.toString()}');

      final responseData = response.data;
      if (responseData is! Map<String, dynamic> || responseData['data'] is! Map<String, dynamic>) {
        throw Exception('Invalid response format');
      }

      if (!context.mounted) return;

      UserModel userModel = UserModel.fromMap(responseData['data'] as Map<String, dynamic>);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Welcome ${userModel.Fullname}',
            style: TextStyle(
              color: const Color.fromARGB(255, 255, 0, 255),
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 0, 0, 255),
          duration: const Duration(seconds: 10),
        ),
      );
    } on Exception catch (e) {
      debugPrint('e ===> ${e.toString()}');
    }
  }
}
