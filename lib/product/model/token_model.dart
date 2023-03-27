
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'token_model.g.dart';

@JsonSerializable()

//token global bir model olduğu için product da oluşturuyoruz.
//eğer servisten bir token çekeceksem de ınetwork ile parse ediyorum
//vexananın best practisi budur

class TokenModel extends INetworkModel<TokenModel>{
  final String? token;
  TokenModel({this.token});
  
  @override
  TokenModel fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return _$TokenModelFromJson(json);
  }
  
  @override 
  Map<String, dynamic>? toJson() {
    // TODO: implement toJson
    return _$TokenModelToJson(this);
  }


}