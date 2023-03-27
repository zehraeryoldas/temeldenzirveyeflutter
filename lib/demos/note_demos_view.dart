import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NoteDemos extends StatelessWidget {
  NoteDemos({Key? key}) : super(key: key);

  final _title = "Create your first note";
  final _description = "add a note";
  final _createNote = "Create a Note";
  final _importNote = "Import Notes";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Padding(
        padding: padding.horizontalPadding,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Image.network(
                "https://media.istockphoto.com/id/1210177764/tr/foto%C4%9Fraf/kalem-ve-elma-ile-kitaplarda-saat.webp?s=612x612&w=is&k=20&c=bIWgpkFr3Mizdzt-EuR9M8sMa8__VBERenQ9nL0-lP8=",
              ),
            ),
            _titleWidget(title: _title),
            Padding(
              padding: padding.verticalPadding,
              child: _SubtitleWidget(
                textAlign: TextAlign.left,
                title: _description * 20,
              ),
            ),
            _createMethod(context),
            TextButton(onPressed: () {}, child: Text(_importNote)),
            SizedBox(
              height: ButtonHeight.ButtonNormalHeight,
            )
          ],
        ),
      ),
    );
  }

  ElevatedButton _createMethod(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: SizedBox(
            height: ButtonHeight.ButtonNormalHeight,
            child: Center(
                child: Text(
              _createNote,
              style: Theme.of(context).textTheme.headline5,
            ))));
  }
}

//center text widget
class _SubtitleWidget extends StatelessWidget {
  _SubtitleWidget(
      {Key? key, this.textAlign = TextAlign.center, required this.title})
      : super(key: key);
  final TextAlign textAlign;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .subtitle1
          ?.copyWith(color: Colors.black, fontWeight: FontWeight.normal),
    );
  }
}

class _titleWidget extends StatelessWidget {
  const _titleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headline5
          ?.copyWith(color: Colors.red, fontWeight: FontWeight.bold),
    );
  }
}

class padding {
  static EdgeInsets horizontalPadding = EdgeInsets.symmetric(horizontal: 20);
  static EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 20);
}

//mesela height sabit olsun istiyoruz
class ButtonHeight {
  static const double ButtonNormalHeight = 50;
}
