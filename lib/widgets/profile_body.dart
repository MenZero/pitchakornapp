// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pitchakornapp/cores/app_constant.dart';

import 'package:pitchakornapp/models/user_model.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Text('Full name : ',style: AppConstant.h3Style()),
              Text('${userModel.Fullname}', style: AppConstant.h3Style()), 
            ],
          ),
          Row(
            children: [
              Text('User Type : ',style: AppConstant.h3Style()),
              Text('${userModel.UserType}', style: AppConstant.h3Style()), 
            ],
          ),
          Row(
            children: [
              Text('User Type Name : ',style: AppConstant.h3Style()),
              Text('${userModel.UserTypeName}', style: AppConstant.h3Style()),
               
            ],
          ),
         
        ],
      ),
    );
  }
}
