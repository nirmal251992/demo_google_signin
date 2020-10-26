import 'package:flutter/material.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'login_page.dart';
import 'ad_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //initialized app id
  Admob.initialize(AdManager.appId);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}