import 'package:challenge_andri_priyandi/presentation/theme/theme.dart';
import 'package:challenge_andri_priyandi/presentation/ui/sign_up_page.dart';
import 'package:challenge_andri_priyandi/presentation/utils/next_screen.dart';
import 'package:challenge_andri_priyandi/presentation/widgets/button/button_primary.dart';
import 'package:challenge_andri_priyandi/presentation/widgets/dialog/custom_dialog.dart';
import 'package:challenge_andri_priyandi/presentation/widgets/textfield/custom_input_paasword.dart';
import 'package:challenge_andri_priyandi/presentation/widgets/textfield/custom_input_text.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submitLogin() {
    if (_userIdController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      showDialog(
        context: context,
        builder: (_) => CustomDialog(
          title: "Alert",
          description: "Login Berhasil",
          buttonText: "OK",
          onTap: () {
            Navigator.pop(context);
          },
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => CustomDialog(
          title: "Alert",
          description: "User ID dan atau Password anda belum diisi.",
          buttonText: "OK",
          onTap: () {
            Navigator.pop(context);
          },
        ),
      );
    }
  }

  Widget header() {
    return Row(
      children: [
        Image.asset("assets/images/header-login.png"),
        Image.asset(
          "assets/images/logo.png",
          width: 120,
        )
      ],
    );
  }

  Widget formLogin() {
    return Container(
      margin: const EdgeInsets.only(
        left: marginPage,
        right: marginPage,
        bottom: 20,
        top: 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Login",
            style: blackTextStyle.copyWith(fontSize: 22, fontWeight: bold),
          ),
          const SizedBox(height: 10),
          Text(
            "Please sign in to continue.",
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          const SizedBox(height: 40),
          CustomInputText(
            title: "User ID",
            controller: _userIdController,
            hintText: "User ID",
          ),
          const SizedBox(height: 40),
          CustomInputPassword(
            title: "Password",
            controller: _passwordController,
            hintText: "Password",
            passwordMode: true,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: const EdgeInsets.only(top: 40),
              width: 160,
              child: ButtonPrimary(
                title: "LOGIN",
                onTap: () => _submitLogin(),
                textStyle:
                    whiteTextStyle.copyWith(fontSize: 16, fontWeight: bold),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            formLogin(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        margin: EdgeInsets.zero,
        child: Center(
          child: GestureDetector(
            onTap: () {
              nextScreen(context, const SignUpPage());
            },
            child: RichText(
              text: TextSpan(
                text: "Don't have an Account?  ",
                style: greyTextStyle.copyWith(fontSize: 14, fontWeight: medium),
                children: <TextSpan>[
                  TextSpan(
                    text: "Sign Up",
                    style: redTextStyle.copyWith(
                        fontSize: 14, fontWeight: semibold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
