import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitchakornapp/widgets/images_widget.dart';
import '../cores/app_constant.dart';
import '../widgets/form_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: Get.width * 0.7, child: ImagesWidget()),
                  ],
                ),
                SizedBox(height: 20),

                Text(AppConstant.appName, style: AppConstant.h1Style()),

                SizedBox(height: 20),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: [
                      FormWidget(hint: 'username', suffixIcon: Icon(Icons.person)),

                      SizedBox(height: 20),

                      FormWidget(hint: 'password', suffixIcon: Icon(Icons.lock)),
                    ],
                  ),
                ),

                Text('password', style: AppConstant.h2Style()),
                Text('Login Page', style: AppConstant.h3Style()),
                Text('button login', style: AppConstant.h3Style()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
