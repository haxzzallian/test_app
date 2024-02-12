import 'package:my_app/theme/colors.dart';
import 'package:my_app/theme/text-styles.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(
          color: color == null ? Colors.white : Colors.black,
        ),
      ),
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        primary: Colors.blue,
      ),
    );
  }
}







/*class AppButton extends StatelessWidget {
  final String text;
  final Color? enabledBtnColor;
  final Color? disabledBtnColor;
  final Color? textColor;
  final bool? enabled;
  final double? paddingVertical;
  final bool? smallButton;
  final Function() onTap;
  const AppButton({
    super.key,
    required this.text,
    this.enabledBtnColor,
    this.textColor,
    this.enabled,
    required this.onTap,
    this.disabledBtnColor,
    this.paddingVertical,
    this.smallButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled == null
          ? onTap
          : enabled!
              ? onTap
              : null,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: enabled == null
                  ? enabledBtnColor ?? appPrimaryColor
                  : enabled!
                      ? enabledBtnColor ?? appPrimaryColor
                      : disabledBtnColor ?? appTertiaryColor,
              width: 1),
          color: enabled == null
              ? enabledBtnColor ?? appPrimaryColor
              : enabled!
                  ? enabledBtnColor ?? appPrimaryColor
                  : disabledBtnColor ?? appTertiaryColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: paddingVertical ?? 15.0),
          child: Center(
            child: Text(text,
                style: bodyText2Style.copyWith(
                    color: enabled != null
                        ? enabled!
                            ? textColor ?? Colors.white
                            : Colors.black
                        : textColor ?? Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18)),
          ),
        ),
      ),
    );
  }
}*/
