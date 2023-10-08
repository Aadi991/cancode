import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: GoogleFonts.dmSans().fontFamily,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF313338),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Text("<CanCode/>",
                style: GoogleFonts.quicksand(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: GoogleFonts.quicksand().fontFamily))),
            Image(
              height: 100,
              width: 100,
              image: NetworkImage(
                  "https://media.discordapp.net/attachments/1131241159994392697/1131844575321935892/CanCode_Designs-transformed.png"),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text("Home",
                  style: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontFamily: GoogleFonts.quicksand().fontFamily))),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text("FAQ",
                  style: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontFamily: GoogleFonts.quicksand().fontFamily))),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text("Contact",
                  style: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontFamily: GoogleFonts.quicksand().fontFamily))),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4,
                        child: Text(
                          "Join us in our mission to spread the knowledge of coding to everyone!",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width / 2,
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4,
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Text(
                                "Join others willing to learn coding for free!",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily:
                                        GoogleFonts.quicksand().fontFamily)),
                            //email and password text fields
                            SizedBox(
                              height: 20,
                            ),
                            Text("Email",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily:
                                        GoogleFonts.quicksand().fontFamily)),
                            SizedBox(
                              height: 5,
                            ),
                            TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Password",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily:
                                        GoogleFonts.quicksand().fontFamily)),
                            SizedBox(
                              height: 5,
                            ),
                            TextField(
                              controller: passwordController,
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            // make a button with a background color of Color #3E2DA2 with text sign up
                            ElevatedButton(
                                onPressed: () async {
                                  try {
                                    final credential = await FirebaseAuth
                                        .instance
                                        .createUserWithEmailAndPassword(
                                            email: emailController.text,
                                            password: passwordController.text);
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'weak-password') {
                                      print(
                                          'The password provided is too weak.');
                                    } else if (e.code ==
                                        'email-already-in-use') {
                                      print(
                                          'The account already exists for that email.');
                                    }
                                  } catch (e) {
                                    print(e);
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily:
                                            GoogleFonts.quicksand().fontFamily,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF3E2DA2),

                                  //remove rounded corners
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2)),
                                )),

                            SizedBox(
                              height: 5,
                            ),
                            RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily:
                                            GoogleFonts.quicksand().fontFamily),
                                    children: [
                                  // text for By signing up for CanCode, you agree to CanCodes's Terms of Service & Privacy Policy.
                                  TextSpan(
                                      text:
                                          "By signing up for CanCode, you agree to CanCodes's "),
                                  TextSpan(
                                      text: "Terms of Service",
                                      style: TextStyle(
                                          color: Colors.blue[900],
                                          fontFamily: GoogleFonts.quicksand()
                                              .fontFamily)),
                                  TextSpan(text: " & "),
                                  TextSpan(
                                      text: "Privacy Policy",
                                      style: TextStyle(
                                          color: Colors.blue[900],
                                          fontFamily: GoogleFonts.quicksand()
                                              .fontFamily)),
                                ])),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Or sign up using:",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily:
                                        GoogleFonts.quicksand().fontFamily)),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    //signInWithGoogle();
                                  },
                                  child: Container(
                                    height: 56,
                                    width: 56,
                                    // decoration: BoxDecoration(color: Colors.blue),
                                    child: Image.asset(
                                        'assets/google_PNG19635.png',
                                        fit: BoxFit.cover),

                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(2),
                                        border:
                                            Border.all(color: Colors.white)),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  height: 56,
                                  width: 56,
                                  // decoration: BoxDecoration(color: Colors.blue),
                                  child: SvgPicture.asset("github-mark.svg"),

                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(2),
                                      border: Border.all(color: Colors.white)),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
