import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import '../button/button_primary.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final Function() onTap;

  const CustomDialog({
    Key? key,
    required this.title,
    required this.description,
    required this.onTap,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget dialogContent() {
      return IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kWhiteColor,
            shape: BoxShape.rectangle,
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: blackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
              ),
              const SizedBox(height: 25),
              Text(
                description,
                textAlign: TextAlign.center,
                style: blackTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(height: 30),
              ButtonPrimary(
                title: buttonText,
                onTap: onTap,
                color: kGreyColor.withOpacity(0.2),
                textStyle: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(),
    );
  }
}
