import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:temeldenzirveyeflutter/202/comment_learn_view.dart';
import 'package:temeldenzirveyeflutter/202/service/post_service.dart';

import '../model/post_model.dart';


// bi view kodunda base_url dir, dio dur yazılmaz. Burada sadece işş yapacak katmanları referans etmemiz lazım

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({super.key});

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  List<postModel>? _items;
  bool _isLoading = false;

  late final Dio _dio;
  final _baseUrl = "https://jsonplaceholder.typicode.com/";

//TEST edilebilir kod başlasınnnnnnnnn
  late final IPostService _postService;
  // late final PostService _postService;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    _postService = PostService();
    fetchPostItemsAdvance();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchPostItems() async {
    _changeLoading();
    final response = await Dio().get(
        "https://jsonplaceholder.typicode.com/posts"); //future döndüğü için await yapmamız gerekiyor

    if (response.statusCode == HttpStatus.ok) {
      //bu işlem başarılı mı?
      final _datas = response.data;

      if (_datas is List) {
        setState(() {
          _items = _datas
              .map((e) => postModel.fromJson(e))
              .toList(); //burada casting işlemi yaptık
        });
      }
    }
    _changeLoading();
  }

  // Future<void> fetchPostItemsAdvance() async {
  //   _changeLoading();
  //   final response =
  //       await _dio.get("posts"); //future döndüğü için await yapmmaız gerekiyor

  //   if (response.statusCode == HttpStatus.ok) {
  //     //bu işlem başarılı mı?
  //     final _datas = response.data;

  //     if (_datas is List) {
  //       setState(() {
  //         _items = _datas.map((e) => postModel.fromJson(e)).toList();
  //       });
  //     }
  //   }
  //   _changeLoading();
  // }

  Future<void> fetchPostItemsAdvance() async {
    _changeLoading();
    _items = await _postService.fetchPostItemsAdvance();
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("postman"),
        actions: [
          _isLoading
              ? CircularProgressIndicator
                  .adaptive() //eğer isloading ise circuları kullan değilse diğer işlemleri kullan
              : const SizedBox.shrink()
        ],
      ),
      body: _items == null
          ? Placeholder()
          : ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10),
              itemCount: _items?.length ?? 0,
              itemBuilder: (context, index) {
                return _PostCard(model: _items?[index]);
              }),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    super.key,
    required postModel? model,
  }) : _model = model;

  final postModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CommentsLearnView(
                        postId: _model?.id,
                      )));
        },
        title: Text(_model?.title ?? ''),
        subtitle: Text(_model?.body ?? ''),
      ),
    );
  }
}
