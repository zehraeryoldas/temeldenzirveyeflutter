import 'package:flutter_test/flutter_test.dart';
import 'package:temeldenzirveyeflutter/404/bloc/feature/login/model/login_model.dart';
import 'package:temeldenzirveyeflutter/404/bloc/feature/login/service/login_service.dart';
import 'package:vexana/vexana.dart';


// void main(){
//   late ILoginService loginService;
//   setUp((){
//     loginService=  LoginService(NetworkManager(options: BaseOptions(baseUrl: 'https://reqres.in/')));
//   });
//   test('Login test - eve.holt@reqres.in & cityslicka', () async{
//     final response=await loginService.login(LoginModel('eve.holt@reqres.in', 'cityslicka'));
//     expect(response.data, isNotNull);
//   });
// }