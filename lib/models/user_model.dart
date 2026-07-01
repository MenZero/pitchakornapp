import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String Username;
  final String Fullname;
  final String UserType;
  final String UserTypeName;
  final String ProvCode;
  final List<Map<String, dynamic>> AssignCodes;

  UserModel({
    required this.Username,
    required this.Fullname,
    required this.UserType,
    required this.UserTypeName,
    required this.ProvCode,
    required this.AssignCodes,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Username': Username,
      'Fullname': Fullname,
      'UserType': UserType,
      'UserTypeName': UserTypeName,
      'ProvCode': ProvCode,
      'AssignCodes': AssignCodes,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    final assignCodesValue = map['AssignCodes'];
    List<Map<String, dynamic>> parsedAssignCodes = [];

    if (assignCodesValue is List) {
      parsedAssignCodes = assignCodesValue
          .whereType<Map>()
          .map<Map<String, dynamic>>((item) => Map<String, dynamic>.from(item))
          .toList();
    }

    final username =
        (map['Username'] ?? map['username'] ?? '').toString();
    final fullname = (map['Fullname'] ?? map['fullname'] ?? map['fullName'] ?? '')
        .toString();
    final userType = (map['UserType'] ?? map['userType'] ?? '').toString();
    final userTypeName =
        (map['UserTypeName'] ?? map['userTypeName'] ?? '').toString();
    final provCode = (map['ProvCode'] ?? map['provCode'] ?? '').toString();

    final userModel = UserModel(
      Username: username,
      Fullname: fullname,
      UserType: userType,
      UserTypeName: userTypeName,
      ProvCode: provCode,
      AssignCodes: List<Map<String, dynamic>>.from(map['AssignCodes'] ?? []),
    );

    debugPrint('AssignCodes ===> ${userModel.AssignCodes}');
    return userModel;
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
