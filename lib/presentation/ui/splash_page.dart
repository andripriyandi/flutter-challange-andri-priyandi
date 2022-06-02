/* Karena splash screen yang sesuai dengan challange menggunakan beberapa image sehingga saya buat custom manual untuk splashnya
  tetapi jika splash screen yang menggunakan 1 image saja saya biasa menggunakan flutter_native_splash karena itu sangat recommended
*/

import 'package:challenge_andri_priyandi/presentation/ui/sign_in_page.dart';
import 'package:challenge_andri_priyandi/presentation/utils/next_screen.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future _afterSplash() async {
    Future.delayed(const Duration(seconds: 2)).then((value) async {
      _goingToSignIn();
    });
  }

  void _goingToSignIn() {
    nextScreenCloseOthers(context, const SignInPage());
  }

  @override
  void initState() {
    _afterSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("assets/images/header-splash.png"),
          Expanded(
            child: Image.asset("assets/images/logo.png"),
          ),
          Image.asset("assets/images/footer-splash.png"),
        ],
      ),
    );
  }
}
