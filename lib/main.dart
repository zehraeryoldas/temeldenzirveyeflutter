import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:temeldenzirveyeflutter/gereksiz/pages/auth/sign_up.dart';
import 'package:temeldenzirveyeflutter/gereksiz/pages/home_page.dart';

import '303/lottie_learn.dart';
import '303/tabbar_advance.dart';
import 'firebase_options.dart';
import 'gereksiz/pages/auth/login_page.dart';
import 'gereksiz/utils/customColors.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   if (kIsWeb) {
//     await Firebase.initializeApp(
//         options: const FirebaseOptions(
//       apiKey: "AIzaSyBLSVq4bArlrZtjTkQFKtFMLabvv-pZkck",
//       projectId: "temeldenzirveyeflutter",
//       messagingSenderId: "826228363275",
//       appId: "1:826228363275:web:db930e4c8aeeda291af70e",
//     ));
//   } else {
//     await Firebase.initializeApp();
//   }
//   runApp(MyApp());
// }

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb || Platform.isAndroid || Platform.isIOS) {
    await Firebase.initializeApp(
    //   options: const FirebaseOptions(
    //   apiKey: 'AIzaSyAjqBHlBRhxUYpMq92kfMk8zsxzW7xFDcY',
    //  projectId: 'campusgo-6eec2',
    //   storageBucket: 'campusgo-6eec2.appspot.com',
    //   messagingSenderId: '898695960774',
    //   appId: '1:898695960774:web:a7a21c5caf34fabb331fc7',
    // )
    options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        "/loginPage": (context) => LoginPage(),
        "/signUp": (context) => SignUp(),
        "/homePage": (context) => HomePage()
      },
      theme: ThemeData(
        scaffoldBackgroundColor: CustomColors.scaffoldBackgroundColor,
      ),
      // home: Scaffold(
      //   body: LoginPage(),
      // ),
      home: TabbarAdvanceLearn(),
    );
  }
}
