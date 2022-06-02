import 'package:challenge_andri_priyandi/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomInputText extends StatelessWidget {
  final String title;
  final String? hintText;
  final TextInputType? inputType;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  final bool autoValid;
  final Widget? preffixWidget;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  const CustomInputText({
    Key? key,
    required this.title,
    required this.controller,
    this.inputType,
    this.hintText,
    this.validator,
    this.onChanged,
    this.autoValid = false,
    this.preffixWidget,
    this.maxLines,
    this.contentPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: blackTextStyle.copyWith(fontSize: 14, fontWeight: regular),
        ),
        const SizedBox(height: 6),
        TextFormField(
          maxLines: maxLines ?? 1,
          controller: controller,
          // ignore: prefer_if_null_operators
          keyboardType: inputType ?? TextInputType.text,
          autovalidateMode:
              autoValid ? AutovalidateMode.onUserInteraction : null,
          validator: validator,
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding: contentPadding ?? const EdgeInsets.all(0),
            hintText: hintText ?? "",
            hintStyle: greyTextStyle.copyWith(
              fontSize: 13,
              fontStyle: FontStyle.italic,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kGreyColor, width: 1),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kBlackColor, width: 1),
            ),
            prefix: preffixWidget ?? const SizedBox(),
            errorStyle: const TextStyle(
              fontSize: 10.0,
            ),
            errorMaxLines: 4,
          ),
        )
      ],
    );
  }
}
