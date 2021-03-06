import 'package:challenge_andri_priyandi/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  final String title;
  final Function() onTap;
  final EdgeInsets? margin;
  final Color? color;
  final bool isLoading;
  final TextStyle? textStyle;
  final bool paddingNonActive;
  final Widget? icon;

  const ButtonPrimary(
      {Key? key,
      required this.title,
      required this.onTap,
      this.color,
      this.margin,
      this.isLoading = false,
      this.paddingNonActive = false,
      this.icon,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: margin ?? EdgeInsets.zero,
      child: TextButton(
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize:
              MaterialStateProperty.all(const Size(double.infinity, 44)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          ),
          backgroundColor: MaterialStateProperty.all(color ?? kPrimaryColor),
        ),
        onPressed: onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon != null
                    ? Row(
                        children: [
                          icon!,
                          const SizedBox(
                            width: 13,
                          ),
                        ],
                      )
                    : const SizedBox(),
                if (isLoading) ...[
                  const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
                Text(
                  title,
                  // ignore: prefer_if_null_operators
                  style: textStyle != null
                      ? textStyle
                      : color == null
                          ? whiteTextStyle.copyWith(
                              fontSize: 14, fontWeight: medium)
                          : primaryTextStyle.copyWith(
                              fontSize: 14, fontWeight: medium),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
