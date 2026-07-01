import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitchakornapp/cores/app_constant.dart';
import 'package:pitchakornapp/cores/app_controller.dart';
import 'package:pitchakornapp/cores/app_service.dart';
import 'package:pitchakornapp/widgets/button_widget.dart';
import 'package:pitchakornapp/widgets/form_widget.dart';
import 'package:pitchakornapp/widgets/images_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AppController appController = Get.put(
    AppController(),
  ); //นี่คือ instance ของ AppController และนำไปใช้ใน login page

  final formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: 80),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: Get.width * 0.8, child: ImagesWidget()),
                  ],
                ),

                SizedBox(height: 16),

                Text(AppConstant.appName, style: AppConstant.h2Style()),

                SizedBox(height: 16),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 32),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        FormWidget(
                          controller: usernameController,
                          hint: 'Username',
                          suffixIcon: Icon(Icons.person_outline),
                          validator: (p0) {
                            if (p0?.isEmpty ?? true) {
                              return 'please fill username';
                            } else {
                              return null;
                            }
                          },
                        ),

                        SizedBox(height: 16),

                        Obx(
                          () => FormWidget(
                            controller: passwordController,
                            validator: (p0) {
                              if (p0?.isEmpty ?? true) {
                                return 'please fill password';
                              } else {
                                return null;
                              }
                            },

                            obscureText: appController.redEye.value,
                            hint: 'Password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                appController.redEye.value =
                                    !appController.redEye.value;
                              },
                              icon: Icon(
                                appController.redEye.value
                                    ? Icons.remove_red_eye
                                    : Icons.remove_red_eye_outlined,
                              ), //ตาเปิดปิด
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 16),

                SizedBox(
                  width: Get.width * 0.8,
                  child: ButtonWiget(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        AppService().checkLogin(
                          username: usernameController.text,
                          password: passwordController.text, context: context,
                        );
                      }
                    },
                    text: 'Login',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}