import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AssignCodeModel {
  final String AssignCode;
  final String ProvinceCode;
  final String DistrictName;
  final String SubDistrictName;
  final String AreaName;
  final String EA_NO;
  final String PSU_NO;

  AssignCodeModel({
    this.AssignCode,
    this.ProvinceCode,
    this.DistrictName,
    this.SubDistrictName,
    this.AreaName,
    this.EA_NO,
    this.PSU_NO,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'AssignCode': AssignCode,
      'ProvinceCode': ProvinceCode,
      'DistrictName': DistrictName,
      'SubDistrictName': SubDistrictName,
      'AreaName': AreaName,
      'EA_NO': EA_NO,
      'PSU_NO': PSU_NO,
    };
  }

  factory AssignCodeModel.fromMap(Map<String, dynamic> map) {
    return AssignCodeModel(
      AssignCode: map['AssignCode'] != null ? map['AssignCode'] as String : null,
      ProvinceCode: map['ProvinceCode'] != null ? map['ProvinceCode'] as String : null,
      DistrictName: map['DistrictName'] != null ? map['DistrictName'] as String : null,
      SubDistrictName: map['SubDistrictName'] != null ? map['SubDistrictName'] as String : null,
      AreaName: map['AreaName'] != null ? map['AreaName'] as String : null,
      EA_NO: map['EA_NO'] != null ? map['EA_NO'] as String : null,
      PSU_NO: map['PSU_NO'] != null ? map['PSU_NO'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AssignCodeModel.fromJson(String source) => AssignCodeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
