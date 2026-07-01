import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:pitchakornapp/cores/app_constant.dart';
import 'package:pitchakornapp/cores/app_service.dart';
import 'package:pitchakornapp/models/assign_code_model.dart';
import 'package:pitchakornapp/models/user_model.dart';
import 'package:pitchakornapp/states/detail_assign_code.dart';
import 'package:pitchakornapp/widgets/button_widget.dart';

class AssignBody extends StatelessWidget {
  const AssignBody({super.key, required this.userModel});

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    final appService = AppService();

    return FutureBuilder(
      future: appService.findListAssignCodeModel(userModel: userModel),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.hasData) {
          final List<AssignCodeModel> assignCodeModels = asyncSnapshot.data!;

          if (assignCodeModels.isEmpty) {
            return const Text('ไม่มีข้อมูล');
          }

          return ListView.builder(
            itemCount: assignCodeModels.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 0, 0),
                    ),
                    child: Text(
                      '${assignCodeModels[index].AssignCode}',
                      style: AppConstant.h3Style(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('AssignArea : '),
                      Text('${assignCodeModels[index].AreaName}'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Province : '),
                      Text('${assignCodeModels[index].ProvinceCode}'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('District : '),
                      Text('${assignCodeModels[index].DistrictName}'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonWiget(
                        onPressed: () {

                          Get.to(DetailAssignCode(assignCode: assignCodeModels[index].AssignCode));


                        },
                        text: 'More Detail',
                        type: GFButtonType.outline,
                      ),
                    ],
                  ),

                  const Divider(),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
