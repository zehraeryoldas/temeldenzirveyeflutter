// ignore: camel_case_types
class postModel {
  int?
      userId; //servisten data geliyorsa her zaman olmayabilir. o yüzden nullable olarak yazmalıyız.
  int? id;
  String? title;
  String? body;

  postModel({this.userId, this.id, this.title, this.body});

//kod yazılmaz   (bunlar servisten datayı alır servise verir!)

  postModel.fromJson(Map<String, dynamic> json) {
    //postmandan data doğrudan map yapısı ile geliyor
    // ve bizim bu mapi cast etmemiz gerekiyor.
    // yani bir listeye bir modele çevirmemiz gerekiyor.
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =
        new Map<String, dynamic>(); //buradada doldurma işlemlerini yapıyoruz.
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
