import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../app_common/app_textfeild_common.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  bool passwordVisible = false;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? userCredential;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF1D5151),
            Color(0xFF58D0D0),
            Color(0xFFFFFFFF),
          ],
          // stops: [0.3, 0.9, 1.0],
          begin: Alignment.topCenter,
          end: Alignment.center,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(left: 30, top: 70, right: 30),
          child: ListView(
            children: [
              const Image(
                image: AssetImage("assets/images/washing-machine.png"),
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
                controller: passwordController,
                textInputAction: TextInputAction.next,
                obscureText: !passwordVisible,
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
              const SizedBox(height: 15),
              TextFieldScreen(
                controller: passwordConfirmController,
                textInputAction: TextInputAction.done,
                obscureText: passwordVisible,
                hintText: "Confirm password",
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
                    debugPrint("Every thing is good!");
                  } else {
                    signupUser();
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
                      "Register ",
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
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ));
                  },
                  child: const Text(
                    "Or Sign Up Using ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      signInWithGoogle();
                    },
                    child: const Image(
                      image: AssetImage("assets/images/gmail.png"),
                      height: 54,
                      width: 54,
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      githubSignIn();
                    },
                    child: const Image(
                      image: AssetImage("assets/images/facebook.png"),
                      height: 54,
                      width: 54,
                    ),
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
      return false;
    } else if (passwordController.text.isEmpty) {
      showToastMessage("please enter confirm password");
      return false;
    } else if (!RegExp(
            "^(?=.*[A-Z].*[A-Z])(?=.*[!@#\$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}")
        .hasMatch(passwordController.text)) {
      showToastMessage("please enter valid confirm password");
    } else {
      return false;
    }
    return true;
  }

  signupUser() async {
    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      )
          .then((value) {
        debugPrint("User Data --> ${value.user}");
        userCredential = value.user;
        value.user!.sendEmailVerification();
        setState(() {});
      });
    } on FirebaseAuthException catch (error) {
      showToastMessage(error.message);
      showToastMessage(error.code);
      debugPrint(error.message);
      debugPrint(error.code);
    }
  }

  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  githubSignIn() async {
    final GitHubSignIn gitHubSignIn = GitHubSignIn(
        clientId: "7309b3fead4bb0a74e65",
        clientSecret: "41871c8010ae07b001a279b54b3d73323783b74c",
        redirectUrl:
            'https://login-signup-app-e3789.firebaseapp.com/__/auth/handler');
    final result = await gitHubSignIn.signIn(context);
    final githubAuthCredential = GithubAuthProvider.credential(result.token!);
    return await FirebaseAuth.instance
        .signInWithCredential(githubAuthCredential);
  }
}
