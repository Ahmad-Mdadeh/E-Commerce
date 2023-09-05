import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  RxBool isVisibility = false.obs;
  bool isCheckBox = false;
  RxString userName = ''.obs;
  RxString userPhotoUrl = ''.obs;
  RxString userEmail = ''.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  FacebookAuth facebookAuth = FacebookAuth.instance;
  bool isSignedIn = false;
  final GetStorage authBox = GetStorage();

  User? get userProfile => auth.currentUser;

  @override
  void onInit() {
    super.onInit();
    userName.value = (userProfile != null ? userProfile!.displayName : '')!;
    userPhotoUrl.value = (userProfile != null ? userProfile!.photoURL : '')!;
    userEmail.value = (userProfile != null ? userProfile!.email : '')!;
  }

  void visibility() {
    isVisibility(!(isVisibility.value));
  }

  void checkBox() {
    isCheckBox = !isCheckBox;
    update();
  }

  void signUpUsingFirebase({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await auth.createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((value) => {
                userName.value = name,
                auth.currentUser!.updateDisplayName(userName.value),
              });
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), " ").capitalize!;
      late String message;
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = 'Ops!..please try again';
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.isDarkMode ? mainColor : pinkClr,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        "Error ! ",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
        colorText: Colors.white,
      );
    }
  }

  void loginUsingFirebase({
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then(
            (value) => userName.value = auth.currentUser!.displayName!,
          );
      isSignedIn = true;
      authBox.write('auth', isSignedIn);
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll('-', ' ').capitalize!;
      late String message;
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else {
        message = 'Ops!..please try again';
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.isDarkMode ? mainColor : pinkClr,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        "Error ! ",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
        colorText: Colors.white,
      );
    }
  }

  void resetPassword({
    required String email,
  }) async {
    try {
      await auth
          .sendPasswordResetEmail(
            email: email,
          )
          .then(
            (value) => userName.value = auth.currentUser!.displayName!,
          );
      update();
      Get.back();
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll('-', ' ').capitalize!;
      late String message;
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else {
        message = 'Ops!..please try again';
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.isDarkMode ? mainColor : pinkClr,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        "Error ! ",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
        colorText: Colors.white,
      );
    }
  }

  void googleSinUp() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      userName.value = googleSignIn.currentUser!.displayName!;
      userPhotoUrl.value = googleSignIn.currentUser!.photoUrl!;
      userEmail.value = googleSignIn.currentUser!.email;
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );
      await auth.signInWithCredential(credential);
      isSignedIn = true;
      authBox.write('auth', isSignedIn);
      update();
      Get.offAllNamed(Routes.mainScreen);
    } catch (e) {
      Get.snackbar(
        "Error ! ",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
        colorText: Colors.white,
      );
    }
  }

  void facebookSinUp() async {
    final LoginResult loginResult = await facebookAuth.login();
    isSignedIn = true;
    authBox.write('auth', isSignedIn);
  }

  void signOutFromApp() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      await facebookAuth.logOut();
      userName.value = '';
      userPhotoUrl.value = '';
      userEmail.value = '';
      isSignedIn = false;
      authBox.remove('auth');
      update();
      Get.offAllNamed(Routes.login);
    } catch (e) {
      Get.snackbar(
        "Error ! ",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
        colorText: Colors.white,
      );
    }
  }
}
