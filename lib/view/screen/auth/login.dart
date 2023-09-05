import 'package:e_commerce/logic/controllers/auth_controller.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/my_string.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widget/auth/auth_elevated_button.dart';
import 'package:e_commerce/view/widget/auth/auth_text_from_filed.dart';
import 'package:e_commerce/view/widget/auth/container_under.dart';
import 'package:e_commerce/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

TextEditingController passController = TextEditingController();
TextEditingController emailController = TextEditingController();

class Login extends StatelessWidget {
  final Controller = Get.find<AuthController>();
  final formKey = GlobalKey<FormState>();

  @override
    Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? darkColor : Colors.white,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 40.0,
                      left: 25.0,
                      right: 25.0,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                              text: "LOG",
                              color: Get.isDarkMode ? pinkClr : mainColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 28.0,
                            ),
                            SizedBox(
                              width: 3.0,
                            ),
                            TextUtils(
                              text: "IN",
                              color: Get.isDarkMode ? Colors.white : darkColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 28.0,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        AuthTextFromField(
                          validator: (value) {
                            if (!RegExp(validationEmail).hasMatch(value))
                              return "invalid email";
                            else
                              return null;
                          },
                          controller: emailController,
                          textInputType: TextInputType.emailAddress,
                          obscureText: false,
                          prefixIcon: Get.isDarkMode
                              ? Icon(
                                  Icons.email,
                                  color: pinkClr,
                                  size: 27.0,
                                )
                              : Image.asset(
                                  'assets/images/email.png',
                                ),
                          suffixIcon: null,
                          hintText: "Email",
                          filled: true,
                          color: Colors.grey,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Obx(() {
                          return AuthTextFromField(
                            validator: (value) {
                              if (value.toString().length < 8)
                                return "Password should be longer";
                              else
                                return null;
                            },
                            controller: passController,
                            textInputType: TextInputType.visiblePassword,
                            obscureText:
                                Controller.isVisibility.value ? false : true,
                            prefixIcon: Get.isDarkMode
                                ? Icon(
                                    Icons.lock,
                                    color: pinkClr,
                                    size: 27.0,
                                  )
                                : Image.asset('assets/images/lock.png'),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(
                                right: 10.0,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Controller.visibility();
                                },
                                icon: Icon(
                                  Controller.isVisibility.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                color: Colors.black,
                              ),
                            ),
                            hintText: "Password",
                            filled: true,
                            color: Colors.grey,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w400,
                          );
                        }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Get.toNamed(Routes.forgetPass);
                              },
                              child: TextUtils(
                                text: "Forger password?",
                                textDecoration: TextDecoration.underline,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                String email = emailController.text.trim();
                                String password = passController.text;
                                Controller.loginUsingFirebase(
                                  email: email,
                                  password: password,
                                );
                              }
                            },
                            color: Get.isDarkMode ? pinkClr : mainColor,
                            text: "LOGIN",
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.052,
                          );
                        }),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextUtils(
                          text: "OR",
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 18.0,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Controller.facebookSinUp();
                              },
                              child: Image.asset("assets/images/facebook.png"),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            InkWell(
                                onTap: () {
                                  Controller.googleSinUp();
                                },
                                child: Image.asset("assets/images/google.png")),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ContainerUnder(
                  text: "Don't have An Account?",
                  function: () {
                    Get.offNamed(Routes.signup);
                  },
                  textButton: "Sign up",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
