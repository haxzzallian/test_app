// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:my_app/theme/text-styles.dart';
import 'package:flutter/material.dart';

class ServiceBox extends StatefulWidget {
  final String? imageUrl;
  String? title1;
  String? title2;
  String? subTitle;
  ServiceBox({
    Key? key,
    required this.imageUrl,
    required this.title1,
    required this.title2,
    required this.subTitle,
  }) : super(key: key);

  @override
  State<ServiceBox> createState() => _ServiceBoxState();
}

class _ServiceBoxState extends State<ServiceBox> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var screenWidth = size.width;
    var screenHeight = size.height;
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(43, 153, 251, 1),
            Color.fromRGBO(55, 34, 117, 1)
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        //color: Color.fromRGBO(43, 153, 251, 1),
      ),
      height: 0.2 * screenHeight,
      width: 0.45 * screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(widget.imageUrl ?? ""),
          Text(widget.title1 ?? "", style: headerText2Style),
          Text(
            widget.title2 ?? "",
            style: headerText2Style,
          ),
          Text(widget.subTitle ?? "", style: bodyText2Style)
        ],
      ),
    );
  }
}
