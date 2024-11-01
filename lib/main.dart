import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram_cloning/firebase_options.dart';
import 'package:instagram_cloning/model/uploadsModel.dart';
import 'package:instagram_cloning/modelView/cameraModelView.dart';
import 'package:instagram_cloning/modelView/hightlightModelView.dart';
import 'package:instagram_cloning/modelView/loginModelView.dart';
import 'package:instagram_cloning/modelView/storyModelView.dart';
import 'package:instagram_cloning/modelView/uploadsModelView.dart';
import 'package:instagram_cloning/modelView/usermodelview.dart';
import 'package:instagram_cloning/view/auth/login_pages.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => Usermodelview(),
      ),
      ChangeNotifierProvider(
        create: (_) => Hightlightmodelview(),
      ),
      ChangeNotifierProvider(
        create: (_) => Loginmodelview(),
      ),
      ChangeNotifierProvider(
        create: (_) => Uploadsmodelview(),
      ),
      ChangeNotifierProvider(
        create: (_) => Storymodelview(),
      ),
      ChangeNotifierProvider(
        create: (_) => Cameramodelview(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: const LoginPages(),
    );
  }
}
