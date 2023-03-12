//import 'package:js/js.dart';

import 'package:firebase_core/firebase_core.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inotes/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:inotes/views/login_view.dart';
import 'package:inotes/views/register_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        '/login/': (context) => const Loginview(),
        '/register/': (context) => const RegisterView(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            // final user = FirebaseAuth.instance.currentUser;
            //if (user?.emailVerified ?? false) {
            //return const Text('Done');
            //} else {
            // return const VerifyEmailView();
            //}
            return const Loginview();

          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
