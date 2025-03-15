import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:pokepedia/screens/home_screen.dart';
import 'package:pokepedia/screens/sign_up_screen.dart';
import 'package:pokepedia/widget/button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;

  @override
  void initState() {
    emailController.addListener((){ listener:(context); });
    passwordController.addListener((){ listener:(context); });
    super.initState();
    emailController.addListener(() {
      setState(() {}); // Forces UI to rebuild when text changes
    });
    passwordController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    emailController.removeListener((){ listener:(context); });
    emailController.removeListener((){ listener:(context); });
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 250,
                    width: 250,
                    child: Lottie.asset('assets/animations/lottie2.json'),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                Text(
                  "Enter valid email and password",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 20.0,
                    left: 20.0,
                    top: 10.0,
                    bottom: 10.0,
                  ),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: "Enter Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 2, color: Colors.orange),
                      ),
                      prefixIconColor: Colors.black,
                      suffixIcon:
                          emailController.text.isEmpty
                              ? Container(width: 0)
                              : IconButton(
                                onPressed: () {
                                  emailController.clear();
                                },
                                icon: Icon(Icons.close, color: Colors.black),
                              ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: [AutofillHints.email],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 20.0,
                    left: 20.0,
                    top: 10.0,
                    bottom: 10.0,
                  ),
                  child: TextFormField(
                    obscureText: obscureText,
                    controller: passwordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: "Enter Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 2, color: Colors.orange),
                      ),
                      prefixIconColor: Colors.black,
                      suffixIcon:
                          passwordController.text.isEmpty
                              ? Container(width: 0)
                              : GestureDetector(
                                onLongPress: () {
                                  setState(() {
                                    obscureText=false;
                                  });
                                },
                                onLongPressUp: (){
                                  setState(() {
                                    obscureText=true;
                                  });
                                },
                                child: Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.black,
                                ),
                              ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: LoadingAnimatedButton(onTap: (){
                    print("Button Pressed");
                    loginUser();
                    final form=formKey.currentState!;
                    String email=emailController.text;
                    String password=passwordController.text;
                    print("email=$email");
                    print("password=$password");
                    if(form.validate()){
                      final email= emailController.text;
                      final password=passwordController.text;
                    }else{}
                  }, child: Text("Login", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.orange),)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    InkWell(
                      onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (_) => SignUpScreen())); },
                      child: Text(
                        "Sign Up!",
                        style: TextStyle(fontSize: 15, color: Colors.orange),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loginUser(){
    if(passwordController.text==""){
      Fluttertoast.showToast(msg: 'Please fillup password section', backgroundColor: Colors.red);
    }else{
      String email=emailController.text;
      String password=passwordController.text;
      FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
      }).catchError((e){
        Fluttertoast.showToast(msg: '$e', backgroundColor: Colors.red);
      });
    }
  }
}
