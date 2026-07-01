import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitchakornapp/models/assign_code_model.dart';
import 'package:pitchakornapp/models/building_code_model.dart';
import 'package:pitchakornapp/models/user_model.dart';
import 'package:pitchakornapp/states/main_home.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class AppService {
  
  Future<List<BuildingCodeModel>> findBuildlist({required String assignCode}) async {

    List<BuildingCodeModel> buildingCodeModels = [];

    return buildingCodeModels;

    // TODO: implement later
    return [];
  }

  Future<List<AssignCodeModel>> findListAssignCodeModel({
    required UserModel userModel,
  }) async {
    List<AssignCodeModel> asignCodeModels = [];

    for (var element in userModel.AssignCodes) {
      AssignCodeModel assignCodeModel = AssignCodeModel.fromMap(element);
      asignCodeModels.add(assignCodeModel);
    }

    return asignCodeModels;
  }


  Future<void> checkLogin({
    required String username,
    required String password,
    required BuildContext context,
  }) async {
    try {
      String urlAPI = 'https://tns.nso.go.th/hh70/API/v2/authenticate.php';

      Map<String, dynamic> body = {};
      body['username'] = username;
      body['password'] = password;

      dio.Dio objectDio = dio.Dio();
      objectDio.options.headers['Content-Type'] = 'multipart/form-data';

      var response = await objectDio.post(
        urlAPI,
        data: dio.FormData.fromMap(body),
      );

      debugPrint('response ===> ${response.toString()}');

      final responseData = response.data;
      if (responseData is! Map<String, dynamic> ||
          responseData['data'] is! Map<String, dynamic>) {
        throw Exception('Invalid response format');
      }

      if (!context.mounted) return;

      final userModel = UserModel.fromMap(
        responseData['data'] as Map<String, dynamic>,
      );

      _showSnackBar(
        context,
        'ยินดีต้อนรับ ${userModel.Fullname}',
        success: true,
      );

      if (context.mounted) {
        Get.offAll(() => MainHome(userModel: userModel));
      }
    } on SocketException catch (e) {
      debugPrint('SocketException ===> ${e.toString()}');
      if (context.mounted) {
        _showSnackBar(
          context,
          'ไม่สามารถเชื่อมต่อกับเซิร์ฟเวอร์ได้ กรุณาตรวจสอบอินเทอร์เน็ตหรือ URL ของระบบ',
          success: false,
        );
      }
    } on dio.DioException catch (e) {
      debugPrint('DioException ===> ${e.toString()}');
      if (context.mounted) {
        _showSnackBar(
          context,
          'เซิร์ฟเวอร์ตอบกลับผิดพลาด (${e.response?.statusCode ?? 'unknown'}) กรุณาลองใหม่อีกครั้ง',
          success: false,
        );
      }
    } on Exception catch (e) {
      debugPrint('e ===> ${e.toString()}');
      if (context.mounted) {
        _showSnackBar(
          context,
          'ไม่สามารถเข้าสู่ระบบได้ กรุณาตรวจสอบชื่อผู้ใช้และรหัสผ่าน',
          success: false,
        );
      }
    }
  }

  void _showSnackBar(
    BuildContext context,
    String message, {
    required bool success,
  }) {
    final messenger =
        scaffoldMessengerKey.currentState ?? ScaffoldMessenger.maybeOf(context);

    messenger?.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: success ? Colors.green : Colors.redAccent,
        duration: const Duration(seconds: 4),
      ),
    );
  }
}
