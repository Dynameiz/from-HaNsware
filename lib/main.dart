import 'package:flutter/material.dart';
import 'package:from_hansware/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const HaNsware());
}
class HaNsware extends StatelessWidget {
  const HaNsware({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const MaterialApp(
      title: "HaNsware",
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

