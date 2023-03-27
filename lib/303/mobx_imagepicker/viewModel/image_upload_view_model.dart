import 'dart:io'; // for File
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart'; // for FilePickerResult

import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:temeldenzirveyeflutter/303/mobx_imagepicker/model/image_upload_response.dart';

import '../services/image_upload_services.dart';

part 'image_upload_view_model.g.dart';

class ImageUploadView = _ImageUploadViewBase with _$ImageUploadView;

abstract class _ImageUploadViewBase with Store {
  @observable
  String imageUrl = '';
  static const _baseUrl =
      "https://firebasestorage.googleapis.com/v0/b/temeldenzirveyeflutter.appspot.com/o/";
  //eğer ekranda dinlemek istiyorsam bunun başına observable atıyorum
  @observable
  File? file;
  @observable
  bool isLoading = false;

  @observable
  String downloadText = '';

  ImageUploadServices imageUploadServices =
      ImageUploadServices(Dio(BaseOptions(baseUrl: _baseUrl)));

  //eğer ekrana haber verilmesini istiyorsam bunu başına action koyuyorum
  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  void updateDownloadText(int send, int total) {
    downloadText = '$send/$total';
  }

  @action
  void uploadImageUrl(ImageUploadResponse? response) {
    if (response == null) return;
    imageUrl =
        "https://firebasestorage.googleapis.com/v0/b/temeldenzirveyeflutter.appspot.com/o/" +
            (response.name?.replaceFirst('/', '%2F') ?? '');
  }

  void init() {}
  //ekranın güncellenmesi için bir action lazım
  @action
  void saveLocalFile(XFile? file) {
    //File olarak verdik ama müşteriden XFile olarak alacağız
    if (file == null) return;
    this.file = File(file.path);
    //    this.file = File(file.path ?? ' '); //bu işlem yerine if ile halledebiliriz.
  }

  Future<void> saveDataToServices() async {
    if (file != null) return;
    changeLoading();
    final response = await imageUploadServices.uploadToImageServer(
        await file!.readAsBytes(), "ZE", onSendProgress: (sent, total) {
      updateDownloadText(sent, total);
    });
    uploadImageUrl(response);
  }
}
