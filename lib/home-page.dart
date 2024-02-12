import 'package:my_app/common/widgets/height-spacer.dart';
import 'package:my_app/common/widgets/service-box.dart';
import 'package:my_app/theme/text-styles.dart';

import 'dart:ui';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home-page";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var screenWidth = size.width;
    var screenHeight = size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(children: [
              const HeightSpacer(0.03),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/LOGO.png",
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              const HeightSpacer(0.07),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("BUYING PROPERTIES", style: headerText1Style),
                      Text("MADE EASY", style: headerText1Style),
                    ],
                  ),
                ],
              ),
              const HeightSpacer(0.2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        const Text(
                          "Take a tour  ",
                          style: TextStyle(
                            color: Color.fromRGBO(255, 215, 0, 1),
                            fontSize: 15,
                          ),
                        ),
                        Image.asset("assets/images/arrow.png"),
                      ],
                    ),
                  ),
                  const Text(
                    "Welcome, James",
                    style: TextStyle(
                      color: Color.fromRGBO(255, 215, 0, 1),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const HeightSpacer(0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ServiceBox(
                    imageUrl: "assets/images/outline_home_icon.png",
                    title1: "Need a",
                    title2: "Property ?",
                    subTitle: "Own a Property & Pay with Ease",
                  ),
                  ServiceBox(
                    imageUrl: "assets/images/developers.png",
                    title1: "Agents &",
                    title2: "Developers",
                    subTitle: "Post & Sell Your Properties",
                  ),
                ],
              ),
              const HeightSpacer(0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ServiceBox(
                    imageUrl: "assets/images/mortgage.png",
                    title1: "Mortgage",
                    title2: "Financing",
                    subTitle: "Access funds to power that ongoing project",
                  ),
                  ServiceBox(
                      imageUrl: "assets/images/User.png",
                      title1: "My Account",
                      title2: "Area",
                      subTitle: "Take me to my Dashboard"),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
