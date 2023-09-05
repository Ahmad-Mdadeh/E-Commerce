import 'package:e_commerce/logic/controllers/auth_controller.dart';
import 'package:e_commerce/utils/my_string.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widget/auth/auth_elevated_button.dart';
import 'package:e_commerce/view/widget/auth/auth_text_from_filed.dart';
import 'package:e_commerce/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

TextEditingController emailController = TextEditingController();

class ForgetPass extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Get.isDarkMode ? darkColor : Colors.white,
          centerTitle: true,
          title: Text(
            "Forget Password",
            style: TextStyle(
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  TextUtils(
                    text:
                        "If you want recover yor account, then please provide your email ID below...",
                    textAlign: TextAlign.center,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 14.0,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    "assets/images/forgetPass.png",
                    width: MediaQuery.of(context).size.width * 0.75,
                  ),
                  SizedBox(
                    height: 40.0,
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
                        : Image.asset('assets/images/forgetPass.png'),
                    suffixIcon: null,
                    hintText: "Email",
                    filled: true,
                    color: Colors.grey,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  GetBuilder<AuthController>(builder: (_) {
                    return AuthButton(
                      function: () {
                        if (formKey.currentState!.validate()) {
                          String email = emailController.text.trim();
                          controller.resetPassword(email: email);
                        }
                      },
                      color: Get.isDarkMode ? pinkClr : mainColor,
                      text: "Send",
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.050,
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
