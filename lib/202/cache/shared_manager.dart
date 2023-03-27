import 'package:shared_preferences/shared_preferences.dart';
import 'package:temeldenzirveyeflutter/202/cache/shared_not_initializ.dart';

enum SharedKeys {
  counter,
  users
} //keyler rastgele yazılmasın buradan kontrol edelim. Zaten lkocalde aham şaham kodlar yazılmaz pek.

//ŞİMDİ ELİMİZDE CİLLOP GİBİ BİR SHARED MANAGER OLDU..
class SharedManager {
  SharedPreferences?
      sharedPreferences; //bana verilmemiş olabilir o yüzden nullable kullnaıyoruz.

  SharedManager() {
    init(); //sharedmanagerın constructorında call ediyoruz. //başladığında çalışsın diye.
  }

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  void _checkPreferences() {
    if (sharedPreferences == null) {
      //burası için exceptionlar yazalım
      //eğer exception buraya düşerse bu fonksiyon çalıştırılsın.
      throw SharedNotInitializeException();
    }
  }

  //Future<void> saveString(String key, String value) async {
  Future<void> saveString(SharedKeys key, String value) async {
    _checkPreferences(); //eğer bir sorun olursa exception fırlatacak ve çalışmayacak
    //final prefs = await SharedPreferences.getInstance();
    await sharedPreferences?.setString(key.name,
        value); //normalde key kısmında sadece counter yazıyordu biz şu an enum ile özelleştirdik onu
  }

//sonradan eklendi
  //Future<void> saveString(String key, String value) async {
  Future<void> saveStringItems(SharedKeys key, List<String> value) async {
    _checkPreferences(); //eğer bir sorun olursa exception fırlatacak ve çalışmayacak
    //final prefs = await SharedPreferences.getInstance();
    await sharedPreferences?.setStringList(key.name,
        value); //normalde key kısmında sadece counter yazıyordu biz şu an enum ile özelleştirdik onu
  }
//sonradan eklendi

  //Future<void> saveString(String key, String value) async {
  List<String>? getStringItems(SharedKeys key) {
    _checkPreferences(); //eğer bir sorun olursa exception fırlatacak ve çalışmayacak
    //final prefs = await SharedPreferences.getInstance();
    return sharedPreferences?.getStringList(
      key.name,
    ); //normalde key kısmında sadece counter yazıyordu biz şu an enum ile özelleştirdik onu
  }

  String? getString(SharedKeys key) {
    //burası bir future rquest değil. Yani datayı keyden okuyabilirim.
    _checkPreferences();
    //final prefs = await SharedPreferences.getInstance();

    return sharedPreferences?.getString(key.name);
  }

  Future<bool> removeItem(SharedKeys key) async {
    _checkPreferences();
    // final prefs = await SharedPreferences.getInstance();
    //return await (sharedPreferences?.remove('counter')) ?? false;
    return await (sharedPreferences?.remove(key.name)) ??
        false; //silinmemiş veya yoktur. O yüzden false yazdık.
  }
}
