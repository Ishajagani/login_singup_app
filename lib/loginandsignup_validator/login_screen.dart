import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_singup_app/loginandsignup_validator/signup_screen.dart';

import '../app_common/app_textfeild_common.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  bool passwordVisible = false;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? userCredential;
  dynamic value;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   userCredential = FirebaseAuth.instance.currentUser;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF081E1E),
            Color(0xFF58D0D0),
            Color(0xFFFFFFFF),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(left: 30, top: 70, right: 30),
          child: ListView(
            children: [
              const Image(
                image: AssetImage("assets/images/washing-machine 1.png"),
                height: 264,
                width: 264,
              ),
              const SizedBox(height: 50),
              TextFieldScreen(
                controller: emailController,
                textInputAction: TextInputAction.next,
                hintText: "E-mail",
                hidePassword: const SizedBox(),
              ),
              const SizedBox(height: 15),
              TextFieldScreen(
                obscureText: !passwordVisible,
                controller: passwordController,
                textInputAction: TextInputAction.next,
                hintText: "Password",
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                  icon: Icon(
                    passwordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  if (validator()) {
                    debugPrint("Successfully!");
                  } else {
                    userLogin();
                  }
                },
                child: Container(
                  height: 39,
                  width: 120,
                  margin: const EdgeInsets.only(left: 80, right: 80),
                  decoration: BoxDecoration(
                    color: const Color(0xff1D5151),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Login ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Roboto",
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ));
                  },
                  child: const Text(
                    "SING UP",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "Or Sign Up Using ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Image(
                    image: AssetImage("assets/images/gmail.png"),
                    height: 54,
                    width: 54,
                  ),
                  SizedBox(width: 20),
                  Image(
                    image: AssetImage("assets/images/facebook.png"),
                    height: 54,
                    width: 54,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  showToastMessage(message) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.black87,
      fontSize: 16,
    );
  }

  bool validator() {
    if (emailController.text.isEmpty) {
      showToastMessage("please enter email");
      return false;
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text)) {
      showToastMessage("please enter valid email");
      return false;
    } else if (passwordController.text.isEmpty) {
      showToastMessage("please enter password");
      return false;
    } else if (!RegExp(
            "^(?=.*[A-Z].*[A-Z])(?=.*[!@#\$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}")
        .hasMatch(passwordController.text)) {
      showToastMessage("please enter valid password");
    } else {
      return false;
    }
    return true;
  }

  userLogin() async {
    try {
      await firebaseAuth
          .signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      )
          .then((value) {
        userCredential = value.user;
        debugPrint("User Data --> ${value.user}");
        if (value.user!.emailVerified) {
          debugPrint("User has Login --> ");
        } else {
          showDialogue();
        }
        setState(() {});
      });
    } on FirebaseAuthException catch (error) {
      showToastMessage("Error Code --->>>${error.code}");
    }
  }

  showDialogue() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          height: 150,
          width: 150,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
          ),
          child: Column(
            children: [
              const Text(
                  "Your Email Address wasn't Verified \n If you want to verify your Email address please press Resend button"),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel")),
                  ElevatedButton(
                      onPressed: () {
                        userCredential!.sendEmailVerification();
                        setState(() {});
                      },
                      child: const Text("Resend"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
