import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../model/image_upload_response.dart';

class ImageUploadServices {
  final Dio dio;

  ImageUploadServices(this.dio);

  // Future<void> UploadToImageServer(Uint8List byteArray, String name) async {
  //   var formData = FormData.fromMap({
  //     '': MultipartFile.fromBytes(byteArray),
  //   });
  //   dio.post('path', data: formData, onSendProgress: (int sent, int total) {});
  // }
  //bu bizim base url'imiz
  //https://firebasestorage.googleapis.com/v0/b/temeldenzirveyeflutter.appspot.com/o/Ekran%20Resmi%202022-12-13%2015.43.42.png

  Future<ImageUploadResponse?> uploadToImageServer(
      Uint8List byteArray, String name,
      {void Function(int, int)? onSendProgress}) async {
    final response = await dio.post(
        'Ekran%20Resmi%202022-12-13%2015.43.42$name.png',
        data: byteArray,
        onSendProgress: onSendProgress);
    //onsendprogreese göre bir matematik yaparak ekrana loading senaryosu atayabiliriz.
    if (response.statusCode == HttpStatus.ok) {
      return ImageUploadResponse.fromJson(response.data);
    }
    return null;
  }
}
