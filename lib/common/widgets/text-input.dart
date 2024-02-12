import 'package:my_app/theme/colors.dart';

import 'package:my_app/theme/text-styles.dart';
import 'package:flutter/material.dart';

import 'package:my_app/common/widgets/height-spacer.dart';

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final Function(String)? validate;
  final bool isPassword, enable;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    required this.validate,
    this.enable = true,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black38,
          )),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black38,
          ))),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hintText';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}





/*class AppTextInput extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String? label;

  final int? maxlines;
  final Widget? suffixWidget;
  final FocusNode focusNode;
  final double height, width, borderRadius;
  final TextInputType textInputType;
  final Function(String)? validate;
  final Color fillColor;
  final bool isPassword, enable;
  final Function()? onTap;
  final Function()? onSuffixTap;
  const AppTextInput(
      {required this.controller,
      this.height = 54,
      this.onTap,
      this.label,
      this.enable = true,
      this.maxlines = 1,
      required this.validate,
      this.fillColor = const Color(0xffF2F2F2),
      this.width = double.maxFinite,
      this.isPassword = false,
      this.borderRadius = 10,
      this.hint = "",
      this.textInputType = TextInputType.text,
      Key? key,
      this.onSuffixTap,
      required this.focusNode,
      this.suffixWidget})
      : super(key: key);

  @override
  State<AppTextInput> createState() => _AppTextInputState();
}

class _AppTextInputState extends State<AppTextInput> {
  bool secure = false;
  Color borderColor = appPrimaryColor;
  Color iconColor = Colors.grey;
  Color backgroundColor = AppColor.separator1Light;

  @override
  Widget build(BuildContext context) {
    borderColor = widget.focusNode.hasFocus
        ? appPrimaryColor
        : widget.controller.text.isEmpty
            ? AppColor.separator2Color
            : appPrimaryColor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != null
            ? Text(
                widget.label!,
                style: headerText1Style.copyWith(fontSize: 22),
              )
            : Container(),
        const HeightSpacer(0.01),
        TextFormField(
          maxLines: widget.maxlines,
          onTap: widget.onTap,
          obscureText: secure,
          enabled: widget.enable,
          controller: widget.controller,
          keyboardType: widget.textInputType,
          validator: (e) {
            return widget.validate == null ? null : widget.validate!(e!);
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 13),
            hintText: widget.hint,
            hintStyle: bodyText2Style.copyWith(color: AppColor.hintTextColor),
            isDense: false,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: borderColor, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: borderColor, width: 1),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey, width: 0.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: appPrimaryColor, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red, width: 0.5),
            ),
            fillColor: backgroundColor,
            filled: true,
          ),
        ),
      ],
    );
  }

  setSecure() {
    setState(() {
      secure = !secure;
    });
  }

  Widget icon() {
    if (secure) {
      return const Icon(Icons.visibility_outlined);
    } else {
      return const Icon(Icons.visibility_off_outlined);
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.isPassword) {
      setState(() {
        secure = true;
      });
    }
  }
}*/
