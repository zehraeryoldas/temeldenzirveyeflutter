import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

import 'custom_exception.dart';

abstract class IFileDownload {
  //bunun amacı iş yapılacak katmanların iskeletini oluşturmak
  bool? downloadITem(FileItem? fileItem);
  void toShare(String path) async {
    //soyut bir sınıfa somut bir özellşk ekledik
    await launch(path);
  }
}

class FileDownload extends IFileDownload with ShareMixin {
  //eğer üst sınıfın özelliklerini tekrar etmek istiyorsam implements yerine extends kullanmalıyım
  @override
  bool? downloadITem(FileItem? fileItem) {
    if (fileItem == null)
      throw FileDownloadException(); //eğer exceptionu çalıştırmak istiyorsak başına throw atmak zorundayız
    print("a");
    return true;

    //return null; //flutterda ister yazalım ister yazmayalım otomatikmen null döner.
  }

  //extends edince bunu vermezsek de olur.
  // @override
  // void toShare(String path) { //sen kendine göre bunun özelliklerini değiştirebilirsin diyor. //polimorfizm
  //   // TODO: implement toShare
  // }

  void smsShare() {}
}

class smsDownload implements IFileDownload {
  //bunu mix ile with edemeyiz.
  @override
  bool? downloadITem(FileItem? fileItem) {
    if (fileItem == null)
      throw FileDownloadException(); //eğer exceptionu çalıştırmak istiyorsak başına throw atmak zorundayız
    print("a");
    return true;

    //return null; //flutterda ister yazalım ister yazmayalım otomatikmen null döner.
  }

  @override
  Future<void> toShare(String path) async {
    // TODO: implement toShare
    await launch("sms: $path");
  }
}

class FileItem {
  final String name;
  final File file;

  FileItem(this.name, this.file);
}

class VeliDownload extends IFileDownload with ShareMixin {
  @override
  bool? downloadITem(FileItem? fileItem) {
    // TODO: implement downloadITem
    throw UnimplementedError();
  }
}

mixin ShareMixin on IFileDownload {
  //mixinlerin başına on koyup sadece belirli durumlardan türemesini sağlayabiliriz.
  //mixinler de abstract class gibi çalışır.

  void toShowFile() {}
}
