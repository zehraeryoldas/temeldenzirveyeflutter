class Model {
  int? userId;
  int? id;
  String? title;
  String? body;
}

class Model2 {
  int userId;
  int id;
  String title;
  String body;
  Model2(this.userId, this.id, this.title, this.body);
}

class Model3 {
  final int userId;
  final int id;
  final String title;
  final String body;

  Model3(this.userId, this.id, this.title, this.body);
}

class Model4 {
  final int userId;
  final int id;
  final String title;
  final String body;

  Model4(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});
}

class Model5 {
  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;

  //String get userId => userId;

  Model5(
      {required int userId,
      required int id,
      required String title,
      required String body})
      : _userId = userId,
        _id = id,
        _title = title,
        _body = body;
}

class Model6 {
  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;

  Model6(
      {required int userId,
      required int id,
      required String title,
      required String body}) {
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
  }
}

class Model7 {
  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;
  Model7({
    int userId = 0,
    int id = 0,
    String title = '',
    String body = '',
  }) {
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
  }
}

//bestPractise
class Model8 {
  final int? userId; //servisten bir data eğer geliyor ise bu nullable olabilir.
  final int? id;
  final String? title;
  final String? body;

//instancenin bir kopyasını oluşturalım
  Model8 copyWith({
    int? userId, //servisten bir data eğer geliyor ise bu nullable olabilir.
    int? id,
    String? title,
    String? body,
  }) {
    return Model8(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Model8({this.userId, this.id, this.title, this.body});
}
