import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'notes_screen.dart';
import 'ui/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth/login_page.dart';
import '../auth/sign_up_page.dart';
import 'ui/splash_screen.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyAe09pHaRA7eNCPUxQUcV7VmHMI8at7jAE",
        appId: "1:303393597490:android:d758bd7841d67fa09a742b",
        messagingSenderId: "303393597490",
        projectId: "project-d84d9",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase CRUD App',
      routes: {
        '/': (context) => SplashScreen(
              child: LoginPage(),
            ),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
