import 'package:e_commerce/logic/controllers/auth_controller.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/my_string.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widget/auth/auth_elevated_button.dart';
import 'package:e_commerce/view/widget/auth/auth_text_from_filed.dart';
import 'package:e_commerce/view/widget/auth/check_box.dart';
import 'package:e_commerce/view/widget/auth/container_under.dart';
import 'package:e_commerce/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

TextEditingController nameController = TextEditingController();
TextEditingController passController = TextEditingController();
TextEditingController emailController = TextEditingController();

class SignUp extends StatelessWidget {
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
                              text: "SIGN",
                              color: Get.isDarkMode ? pinkClr : mainColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 28.0,
                            ),
                            SizedBox(
                              width: 3.0,
                            ),
                            TextUtils(
                              text: "UP",
                              color: Get.isDarkMode ? Colors.white : darkColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 28.0,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        AuthTextFromField(
                          validator: (value) {
                            if (value.toString().length <= 2 &&
                                !RegExp(validationName).hasMatch(value))
                              return "Enter valid name";
                            else
                              return null;
                          },
                          controller: nameController,
                          textInputType: TextInputType.text,
                          obscureText: false,
                          prefixIcon: Get.isDarkMode
                              ? Icon(
                                  Icons.person,
                                  color: pinkClr,
                                  size: 27.0,
                                )
                              : Image.asset(
                                  'assets/images/user.png',
                                ),
                          suffixIcon: null,
                          hintText: "User Name",
                          filled: true,
                          color: Colors.grey,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w400,
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
                                : Image.asset(
                                    'assets/images/lock.png',
                                  ),
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
                        SizedBox(
                          height: 30.0,
                        ),
                        CheckBox(),
                        SizedBox(
                          height: 60.0,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthButton(
                            function: () {
                              if(!Controller.isCheckBox){
                                Get.snackbar(
                                  "Ops!",
                                  "You must agree to the terms of use ",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Get.isDarkMode ? mainColor : pinkClr,
                                  colorText: Colors.white,

                                );
                              }else {
                                if (formKey.currentState!.validate()) {
                                  String name = nameController.text.trim();
                                  String email = emailController.text.trim();
                                  String password = passController.text;
                                  Controller.signUpUsingFirebase(
                                    name: name,
                                    email: email,
                                    password: password,
                                  );
                                }
                              }
                            },
                            color: Get.isDarkMode ? pinkClr : mainColor,
                            text: "SIGN UP",
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.052,
                          );
                        })
                      ],
                    ),
                  ),
                ),
                ContainerUnder(
                  text: "Already have an Account?",
                  function: () {
                    Get.offNamed(Routes.login);
                  },
                  textButton: "Login",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
