// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitchakornapp/cores/app_controller.dart';
import 'package:pitchakornapp/widgets/assign_body.dart';
import 'package:pitchakornapp/widgets/profile_body.dart';
import 'package:pitchakornapp/models/user_model.dart';


class MainHome extends StatefulWidget {
  const MainHome({Key? key, required this.userModel}) : super(key: key);

  final UserModel userModel;

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  late final List<String> titles;
  late final List<IconData> icons;
  late final List<BottomNavigationBarItem> items;

  final AppController appController = Get.put(AppController());

  late final List<Widget> bodys;

  @override
  void initState() {
    super.initState();
    titles = ['Assignment', 'Profile'];
    icons = [Icons.assignment, Icons.person];
    bodys = [
      AssignBody(userModel: widget.userModel),
      ProfileBody(userModel: widget.userModel),
    ];
    items = List.generate(
      titles.length,
      (index) => BottomNavigationBarItem(
        icon: Icon(icons[index]),
        label: titles[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(title: Text(titles[appController.indexBody.value])),
        body: bodys[appController.indexBody.value],
        bottomNavigationBar: BottomNavigationBar(
          items: items,
          currentIndex: appController.indexBody.value,
          onTap: (value) {
            appController.indexBody.value = value;
          },
        ),
      ),
    );
  }
}
