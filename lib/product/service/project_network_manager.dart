import 'package:dio/dio.dart';

class ProjectNetworkManager {
  //buraya sadece bir kişi erişsin bu fonksiyonu private çekelim
  ProjectNetworkManager._() {
    _dio = Dio(BaseOptions(baseUrl: 'https://pub.dev/'));
  }
  late final Dio _dio;

  //yani bu classi singelton yapalım.üsttekini
  //bu classa sadece bu instance üzerinden devam edelim.
  static ProjectNetworkManager instance = ProjectNetworkManager._();
  Dio get service => _dio;
}
