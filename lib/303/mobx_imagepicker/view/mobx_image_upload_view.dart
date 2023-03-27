import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:temeldenzirveyeflutter/product/utility/image_upload.dart';

import '../viewModel/image_upload_view_model.dart';


class MobxImageUpload extends StatefulWidget {
  const MobxImageUpload({super.key});

  @override
  State<MobxImageUpload> createState() => _MobxImageUploadState();
}

class _MobxImageUploadState extends State<MobxImageUpload> {
  final String _imageUploadLottiePath =
      "https://assets7.lottiefiles.com/packages/lf20_urbk83vw.json";

  //view_modeli handle etmemiz lazım
  final _imageUploadView =
      ImageUploadView(); //ben request atacam ve ekranda bir şeyler değişecek

  //ben bunun viewmodel tarafına göndermek istiyorum
  final _imageuploadManager = ImageUploadManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            _imageUploadView.saveDataToServices();
          }),
      appBar: AppBar(
        title: Text("Image Upload!"),
        actions: [
          Observer(builder: (_) {
            return _imageUploadView.isLoading
                ? const CircularProgressIndicator()
                : const SizedBox();
          }),
          Observer(builder: (_) {
            return Text(_imageUploadView.downloadText);
          })
        ],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 2, //ekranın yüzde 2 si burada olsun dedik
              child: Card(
                elevation: 10,
                child: Row(
                  children: [
                    //ekrana haber vermesi için observable ile sardık
                    Expanded(
                      child: Observer(builder: (context) {
                        return _imageUploadView.file != null
                            ? Image.file(_imageUploadView.file!)
                            : SizedBox();
                      }),
                    ),
                    Expanded(
                      child: FittedBox(
                        child: IconButton(
                            onPressed: () async {
                              _imageUploadView.saveLocalFile(
                                  await _imageuploadManager.fetchFromLibrary());
                            },
                            icon: Lottie.network(_imageUploadLottiePath)),
                      ),
                    ),
                  ],
                ),
              )),
          Divider(),
          Expanded(
              flex: 4,
              child: Observer(builder: (_) {
                return _imageUploadView.imageUrl.isNotEmpty
                    ? Image.network(_imageUploadView.imageUrl)
                    : SizedBox();
              }))
          //boş alan
        ],
      ),
    );
  }
}
