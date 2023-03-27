import 'package:json_annotation/json_annotation.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends INetworkModel<LoginModel>{
  final String email;
  final String password;

  LoginModel(this.email, this.password);
  
  @override
  LoginModel fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
  
  @override
  Map<String, dynamic>? toJson() {
    // TODO: implement toJson
    return _$LoginModelToJson(this);
  }
}