import 'package:challenge_andri_priyandi/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomInputPassword extends StatefulWidget {
  final String title;
  final String? hintText;
  final TextInputType? inputType;
  final TextEditingController controller;
  final bool passwordMode;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  final bool autoValid;
  final Widget? preffixWidget;
  final int? maxLines;
  const CustomInputPassword(
      {Key? key,
      required this.title,
      required this.controller,
      this.inputType,
      this.hintText,
      this.validator,
      this.onChanged,
      this.autoValid = false,
      this.passwordMode = true,
      this.preffixWidget,
      this.maxLines})
      : super(key: key);

  @override
  State<CustomInputPassword> createState() => _CustomInputSufflixState();
}

class _CustomInputSufflixState extends State<CustomInputPassword> {
  bool _passwordInVisible = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: blackTextStyle.copyWith(fontSize: 14, fontWeight: regular),
        ),
        const SizedBox(height: 6),
        TextFormField(
          maxLines: widget.maxLines ?? 1,
          controller: widget.controller,
          // ignore: prefer_if_null_operators
          keyboardType: widget.inputType ?? TextInputType.text,
          autovalidateMode:
              widget.autoValid ? AutovalidateMode.onUserInteraction : null,
          obscureText: widget.passwordMode ? _passwordInVisible : false,
          validator: widget.validator,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            hintText: widget.hintText == null ? "" : widget.hintText!,
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
            prefix: widget.preffixWidget ?? const SizedBox(),
            suffixIcon: widget.passwordMode
                ? IconButton(
                    icon: Icon(
                      _passwordInVisible
                          ? Icons.visibility_off
                          : Icons
                              .visibility, //change icon based on boolean value
                      color: kGreyColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordInVisible =
                            !_passwordInVisible; //change boolean value
                      });
                    },
                  )
                : const SizedBox(),
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
