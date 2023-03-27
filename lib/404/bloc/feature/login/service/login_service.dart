//Vexana Modelinizi INetworkModel ile sarmalısınız, böylece modelin toJson ve fromJson yöntemleri olduğunu anlıyoruz.
import 'package:temeldenzirveyeflutter/404/bloc/feature/login/model/login_model.dart';
import 'package:temeldenzirveyeflutter/product/model/token_model.dart';
import 'package:vexana/vexana.dart';
abstract class ILoginService{
   //bunbu kullanabilmemiz için yani vexanayı ınetworkmanageri almalıyız.
  final INetworkManager networkManager;
  ILoginService(this.networkManager);
  //geriye Future<Tokenmodel> döndürüyoruz
  Future<IResponseModel<TokenModel?, INetworkModel?>> login(LoginModel model);
  final String _loginPath='api/login';
}
class LoginService extends ILoginService{
  LoginService(INetworkManager networkManager) : super(networkManager);

  @override
   Future<IResponseModel<TokenModel?, INetworkModel?>> login(LoginModel model)async{
   return await networkManager.send<TokenModel, TokenModel>(_loginPath,
   data: model, parseModel: TokenModel(), method: RequestType.POST);
    
  }
}