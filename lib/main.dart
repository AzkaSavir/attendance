import 'package:absensi/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyDXSxaYyyA17_Um9uzQaZrc2_u-kXFU_wE', // current_key
        appId: "1:287737690111:android:a5ab0d2a54418bff6219ca", // mobilesdk_app_id
        messagingSenderId: '287737690111', // project_number
        projectId: "absensi-f9c2c" // project__id
    )
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        cardTheme: CardTheme(
          surfaceTintColor: Colors.white,
        ),
        dialogTheme: DialogTheme(
          surfaceTintColor: Colors.white,
            backgroundColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent
        ),
        useMaterial3: true
      ),
      home: const HomeScreen(),
    );
  }
}

