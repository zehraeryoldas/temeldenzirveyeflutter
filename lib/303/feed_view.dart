import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:temeldenzirveyeflutter/202/model/post_model.dart';
import 'package:temeldenzirveyeflutter/202/service/post_service.dart';


class FeedView extends StatefulWidget {
  const FeedView({super.key});

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView>
    with AutomaticKeepAliveClientMixin {
  //(veli hoca 45. dk partof videosu)
  final IPostService _postService = PostService();
  late final Future<List<postModel>?> _itemsFuture;

  @override
  //burada çalışıp bitecek şimdi kod
  void initState() {
    // TODO: implement initState
    super.initState();

    _itemsFuture = _postService.fetchPostItemsAdvance();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    //açılır açılmaz servisten veri çeksin

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        //bununla tekrardan rebuld işlemi gerçekleştirelim
        //setstatei initstateden önce yazdık ve denedik.
        setState(() {});
      }),
      appBar: AppBar(),
      body: FutureBuilder<List<postModel>?>(
          future: _itemsFuture,
          builder:
              (BuildContext context, AsyncSnapshot<List<postModel>?> snapshot) {
            switch (snapshot.connectionState) {
              //internet olmadığında
              case ConnectionState.none:
                return Placeholder();
              //interneti beklerken
              case ConnectionState.waiting:

              //internet aktif olarak devam ettiğinde
              case ConnectionState.active:
                return Center(
                  child: CircularProgressIndicator(),
                );
              //veya bittiğinde
              case ConnectionState.done:
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            title: Text(snapshot.data?[index].body ?? ''),
                          ),
                        );
                      });
                } else {
                  return Placeholder();
                }
            }
          }),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
