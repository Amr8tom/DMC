import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:help_code/Screens/HomeLayout/homeLayout.dart';
import 'package:help_code/Screens/Authentication/register.dart';
import 'register.dart';
class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var FormKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    FirebaseAuth fir_obj = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(title: Text(" DMC Gate",style: TextStyle(
        color: Colors.blue
      ),),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Form(
            key:FormKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'First & Beast App To Detect Oral Cancer',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),  Text(
                    'log in to Check your Oral',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    cursorColor: Colors.white,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    validator: (String ? value){
                      if(value==null || value.isEmpty==true){
                        return ("please enter the email Address");
                      }
                    },
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      labelText: 'Email Address',
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    cursorColor: Colors.white,
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    validator: (value){
                      if(value?.isEmpty==true|| value==null){
                        return "please enther the password";
                      }
                    },
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      labelText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      suffixIcon: Icon(
                        Icons.remove_red_eye,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  // the Login button and uthentication
                  Container(
                    width: double.infinity,
                    color: Colors.blue,
                    child: MaterialButton(
                      onPressed: () async{
                          // fir_obj.signInWithEmailAndPassword(
                          //     email:emailController.toString(),password: passwordController.toString()
                          // );
                          // Navigator.push(context,MaterialPageRoute(builder:(context) => TheHome()));
                        if(FormKey.currentState!.validate()==true){
                          try {
                             await fir_obj.signInWithEmailAndPassword(email: emailController.text, password:passwordController.text);
                             Navigator.push(context,MaterialPageRoute(builder:(context) => TheHome()));
                          }on FirebaseAuthException catch (e){
                            if(e.code=="user-not-found"){
                              // User does not exist
                            } else if (e.code == 'wrong-password') {
                              // Wrong password
                            }
                          } catch (e) {
                            // Some other error occurred
                          }
                        }

                        },
                      //},
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {Navigator.push(context,MaterialPageRoute(builder:(context) => register()));},
                        child: Text(
                          'Register Now',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    //if(FormKey.currentState!.validate()){
  }
}