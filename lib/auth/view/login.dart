import 'package:my_app/common/widgets/height-spacer.dart';
import 'package:my_app/common/widgets/text-input.dart';
import 'package:my_app/common/widgets/height-spacer.dart';

import 'package:my_app/auth/auth-service/auth-service.dart';
import 'package:my_app/theme/colors.dart';

import 'package:my_app/common/widgets/app-button.dart';

import 'package:flutter/material.dart';
import 'package:the_validator/the_validator.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signin;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  final usernameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  bool checked = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
  }

  void signUpUser() {}

  void signInUser() {
    authService.signInUser(
      context: context,
      username: _usernameController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ListTile(
                tileColor: _auth == Auth.signin
                    ? AppColor.backgroundColor
                    : AppColor.greyBackgroundCOlor,
                title: const Text(
                  'Sign-In.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: AppColor.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signin)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: AppColor.backgroundColor,
                  child: Form(
                    key: _signInFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _usernameController,
                          hintText: 'Username',
                          validate: FieldValidator.minLength(3),
                        ),
                        const HeightSpacer(0.02),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Password',
                          validate: FieldValidator.password(),
                          isPassword: true,
                        ),
                        const HeightSpacer(0.02),
                        CustomButton(
                          text: 'Sign In',
                          onTap: () {
                            if (_signInFormKey.currentState!.validate()) {
                              signInUser();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ListTile(
                tileColor: _auth == Auth.signup
                    ? AppColor.backgroundColor
                    : AppColor.greyBackgroundCOlor,
                title: const Text(
                  'Create Account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: AppColor.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signup)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: AppColor.backgroundColor,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _usernameController,
                          hintText: 'Name',
                          validate: FieldValidator.minLength(3),
                        ),
                        const HeightSpacer(0.02),
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Email',
                          validate: FieldValidator.email(),
                        ),
                        const HeightSpacer(0.02),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Password',
                          validate: FieldValidator.password(),
                          isPassword: true,
                        ),
                        const HeightSpacer(0.02),
                        CustomButton(
                          text: 'Sign Up',
                          onTap: () {
                            if (_signUpFormKey.currentState!.validate()) {
                              signUpUser();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
