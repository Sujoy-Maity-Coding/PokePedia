import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:pokepedia/screens/home_screen.dart';
import 'package:pokepedia/screens/login_screen.dart';

import '../widget/button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;

  @override
  void initState() {
    super.initState();
    nameController.addListener(() {
      setState(() {});
    });
    emailController.addListener(() {
      setState(() {});
    });
    passwordController.addListener(() {
      setState(() {});
    });
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
                    height: 200,
                    width: 200,
                    child: Lottie.asset('assets/animations/lottie1.json'),
                  ),
                ),
                Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                Text(
                  "Put correct values",
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
                    controller: nameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "Enter Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 2, color: Colors.orange),
                      ),
                      prefixIconColor: Colors.black,
                      suffixIcon:
                      nameController.text.isEmpty
                          ? Container(width: 0)
                          : IconButton(
                        onPressed: () {
                          nameController.clear();
                        },
                        icon: Icon(Icons.close, color: Colors.black),
                      ),
                    ),
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
                    registerUser();
                    final form=formKey.currentState!;
                    String email=emailController.text;
                    String password=passwordController.text;
                    String name=nameController.text;
                    print("email=$email");
                    print("password=$password");
                    print("name=$name");
                    if(form.validate()){
                      final email= emailController.text;
                      final password=passwordController.text;
                    }else{}
                  }, child: Text("SignUp", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.orange),)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    InkWell(
                      onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen())); },
                      child: Text(
                        "Login!",
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

  void registerUser(){
    if(passwordController.text==""){
      Fluttertoast.showToast(msg: 'Please fillup password section', backgroundColor: Colors.red);
    } else if(emailController.text==""){
      Fluttertoast.showToast(msg: 'Please fillup email section', backgroundColor: Colors.red);
    } else if(nameController.text==""){
      Fluttertoast.showToast(msg: 'Please fillup name section', backgroundColor: Colors.red);
    } else{
      String email=emailController.text;
      String password=passwordController.text;
      FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value){
        if(value!=null){
          var user=value.user;
          var uid=user!.uid;
          addUser(uid);
        }
      }).catchError((e){
        Fluttertoast.showToast(msg: "$e", backgroundColor: Colors.red);
      });
    }
  }

  void addUser(String uid){
    Map<String,dynamic> usersData={
      'uid':uid,
      'name':nameController.text,
      'email':emailController.text,
      'passwrod':passwordController.text
    };
    FirebaseFirestore.instance.collection('users').doc(uid).set(usersData).then((onValue){
      Fluttertoast.showToast(msg: "Registration Successful", backgroundColor: Colors.green);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
    }).catchError((e){
      Fluttertoast.showToast(msg: "$e", backgroundColor: Colors.red);
    });
  }
}
