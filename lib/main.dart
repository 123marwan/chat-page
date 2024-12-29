import 'package:chatapp/screens/chat_page.dart';
import 'package:chatapp/screens/login_screen.dart';
import 'package:chatapp/screens/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';




void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(app());
}
class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'login',
      routes: {
        'login':(context)=>login(),
        'register':(context)=>register(),
        'chatpage':(context)=>chatpage(),
      },
      debugShowCheckedModeBanner: false,


    );
  }
}
