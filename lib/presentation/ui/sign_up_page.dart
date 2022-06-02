
import 'package:challenge_andri_priyandi/presentation/theme/theme.dart';
import 'package:challenge_andri_priyandi/presentation/ui/sign_in_page.dart';
import 'package:challenge_andri_priyandi/presentation/utils/next_screen.dart';
import 'package:challenge_andri_priyandi/presentation/widgets/button/button_primary.dart';
import 'package:challenge_andri_priyandi/presentation/widgets/textfield/custom_input_paasword.dart';
import 'package:challenge_andri_priyandi/presentation/widgets/textfield/custom_input_text.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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

  Widget formRegister() {
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
            "Sign Up",
            style: blackTextStyle.copyWith(fontSize: 22, fontWeight: bold),
          ),
          const SizedBox(height: 10),
          Text(
            "Create an Account.",
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          const SizedBox(height: 40),
          CustomInputText(
            title: "Nama",
            controller: _nameController,
            hintText: "Nama",
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
                title: "Sign Up",
                onTap: () {},
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
            formRegister(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        margin: EdgeInsets.zero,
        child: Center(
          child: GestureDetector(
            onTap: () {
              nextScreenCloseOthers(context, const SignInPage());
            },
            child: RichText(
              text: TextSpan(
                text: "Already have an account?  ",
                style: greyTextStyle.copyWith(fontSize: 14, fontWeight: medium),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Sign In',
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
