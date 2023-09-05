import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widget/auth/auth_elevated_button.dart';
import 'package:e_commerce/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Image(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                color: Colors.black.withOpacity(0.3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100.0,
                    ),
                    Container(
                      width: 190,
                      height: 60,
                      child: Center(
                        child: TextUtils(
                          text: "Welcome",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35.0,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: 230,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextUtils(
                            text: "Astro",
                            color: Color(0xff00BE84),
                            fontWeight: FontWeight.bold,
                            fontSize: 35.0,
                          ),
                          SizedBox(
                            width: 7.0,
                          ),
                          TextUtils(
                            text: "Shop",
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35.0,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 250.0,
                    ),
                Container(
                  width: 175,
                  height: 63,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Get.offNamed(Routes.login);
                    },
                    child: TextUtils(
                      text: "Get Start",
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 17.0,

                    ),
                  ),
                ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextUtils(
                          text: "Don't have An Account?",
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0,
                        ),
                        TextButton(
                          onPressed: () {
                            Get.offNamed(Routes.signup);
                          },
                          child: TextUtils(
                            text: "Sign Up",
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                            textDecoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
