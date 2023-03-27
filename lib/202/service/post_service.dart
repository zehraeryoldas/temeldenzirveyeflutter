import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:temeldenzirveyeflutter/202/model/comment_model.dart';
import 'package:temeldenzirveyeflutter/202/model/post_model.dart';


abstract class IPostService {
  //metodları kapatıp sadece interface üzerinden erşim sağlanabilsin
  Future<bool> addItemToService(postModel model);
  Future<bool> putITemToService(postModel model, int id);
  Future<bool> deleteItemToService(int id);
  Future<List<postModel>?> fetchPostItemsAdvance();
  Future<List<CommentModel>?> fetchReleatedCommentsWithPostId(int postId);
}

class PostService implements IPostService {
  final Dio _dio;
  PostService()
      : _dio =
            Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));

  @override
  Future<bool> addItemToService(postModel model) async {
    //buraya dışarıdan kontrol olması için private değişken tanımlamamalıyız
    //başarılı mı başarısız mı diye sonuçlanması için bool verdik
    try {
      final response =
          await _dio.post(_PostServicePaths.posts.name, data: model);
      //if (response.statusCode == HttpStatus.created) {}
      return response.statusCode ==
          HttpStatus.created; //işlem başarılıysa direkt bu cevabı ver
    } on DioError catch (error) {
      print(error.message);
    }
    return false;
  }

  @override
  Future<bool> putITemToService(postModel model, int id) async {
    //modeli update etmek için bize id lazım
    //buraya dışarıdan kontrol olması için private değişken tanımlamamalıyız
    //başarılı mı başarısız mı diye sonuçlanması için bool verdik
    try {
      final response =
          await _dio.put("${_PostServicePaths.posts.name}/$id", data: model);
      //if (response.statusCode == HttpStatus.created) {}
      return response.statusCode == HttpStatus.ok;
    } on DioError catch (error) {
      print(error.message);
    }
    return false;
  }

  @override
  Future<bool> deleteItemToService(int id) async {
    //buraya dışarıdan kontrol olması için private değişken tanımlamamalıyız
    //başarılı mı başarısız mı diye sonuçlanması için bool verdik
    try {
      final response = await _dio.delete(
          "${_PostServicePaths.posts.name}/$id"); //doğrudan postun id sine gidiyor ve data almasına gerek yok
      //if (response.statusCode == HttpStatus.created) {}
      return response.statusCode == HttpStatus.ok;
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception, this);
    }
    return false;
  }

  @override
  Future<List<postModel>?> fetchPostItemsAdvance() async {
    try {
      final response = await _dio.get(_PostServicePaths
          .posts.name); //future döndüğü için await yapmamaz gerekiyor

      if (response.statusCode == HttpStatus.ok) {
        //bu işlem başarılı mı?
        final _datas = response.data;

        if (_datas is List) {
          return _datas //map lemek demek bu listeyi yeni bir objeye dönüştürmek yani bu listeyi yeni bir listeye dönüştürmek
              .map((e) => postModel.fromJson(e))
              .toList(); //eğer yukarıdaki işlem başarılı ise burayı çalıştır
        }
      }
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception, this);
    }
    return null;
  }

  @override
  Future<List<CommentModel>?> fetchReleatedCommentsWithPostId(
      int postId) async {
    // TODO: implement fetchReleatedCommentsWithPostId
    try {
      final response = await _dio.get(_PostServicePaths.comments.name,
          queryParameters: {
            _PostQueryPaths.postId.name: postId
          }); //future döndüğü için await yapmamaz gerekiyor

      if (response.statusCode == HttpStatus.ok) {
        //bu işlem başarılı mı?
        final _datas = response.data;

        if (_datas is List) {
          return _datas
              .map((e) => CommentModel.fromJson(e))
              .toList(); //eğer yukarıdaki işlem başarılı ise burayı çalıştır
        }
      }
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception, this);
    }
    return null;
  }
}

enum _PostServicePaths {
  posts,
  comments;
}

enum _PostQueryPaths { postId }

class _ShowDebug {
  static void showDioError<T>(DioError error, T type) {
    if (kDebugMode) {
      print(error.message); //bu kdebugmode içinde kullanalım
      print("------------");
      print(type);
    }
  }
}








// class PostService {
//   final Dio _dio;
//   PostService()
//       : _dio =
//             Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));

//   Future<bool> addItemToService(postModel model) async {
//     //buraya dışarıdan kontrol olması için private değişken tanımlamamalıyız
//     //başarılı mı başarısız mı diye sonuçlanması için bool verdik
//     try {
//       final response =
//           await _dio.post(_PostServicePaths.posts.name, data: model);
//       //if (response.statusCode == HttpStatus.created) {}
//       return response.statusCode ==
//           HttpStatus.created; //işlem başarılıysa direkt bu cevabı ver
//     } on DioError catch (error) {
//       print(error.message);
//     }
//     return false;
//   }

//   Future<bool> putITemToService(postModel model, int id) async {
//     //modeli update etmek için bize id lazım
//     //buraya dışarıdan kontrol olması için private değişken tanımlamamalıyız
//     //başarılı mı başarısız mı diye sonuçlanması için bool verdik
//     try {
//       final response =
//           await _dio.put("${_PostServicePaths.posts.name}/$id", data: model);
//       //if (response.statusCode == HttpStatus.created) {}
//       return response.statusCode == HttpStatus.ok;
//     } on DioError catch (error) {
//       print(error.message);
//     }
//     return false;
//   }

//   Future<bool> deleteItemToService(int id) async {
//     //buraya dışarıdan kontrol olması için private değişken tanımlamamalıyız
//     //başarılı mı başarısız mı diye sonuçlanması için bool verdik
//     try {
//       final response = await _dio.delete(
//           "${_PostServicePaths.posts.name}/$id"); //doğrudan postun id sine gidiyor ve data almasına gerek yok
//       //if (response.statusCode == HttpStatus.created) {}
//       return response.statusCode == HttpStatus.ok;
//     } on DioError catch (exception) {
//       _ShowDebug.showDioError(exception);
//     }
//     return false;
//   }

//   Future<List<postModel>?> fetchPostItemsAdvance() async {
//     try {
//       final response = await _dio.get(_PostServicePaths
//           .posts.name); //future döndüğü için await yapmamaz gerekiyor

//       if (response.statusCode == HttpStatus.ok) {
//         //bu işlem başarılı mı?
//         final _datas = response.data;

//         if (_datas is List) {
//           return _datas
//               .map((e) => postModel.fromJson(e))
//               .toList(); //eğer yukarıdaki işlem başarılı ise burayı çalıştır
//         }
//       }
//     } on DioError catch (exception) {
//       _ShowDebug.showDioError(exception);
//     }
//     return null;
//   }
// }

// enum _PostServicePaths {
//   posts,
//   comments;
// }

// class _ShowDebug {
//   static void showDioError(DioError error) {
//     if (kDebugMode) {
//       print(error.message); //bu kdebugmode içinde kullanalım
//     }
//   }
// }

