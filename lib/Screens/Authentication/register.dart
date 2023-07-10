import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
class register extends StatelessWidget {
  const register({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var Emialcontrollar= TextEditingController();
    var passwordcontoller= TextEditingController();
    var phomnenumbercontroller= TextEditingController();
    var universityController= TextEditingController();
    var FormKey=GlobalKey<FormState>();
    FirebaseAuth fir_obj=FirebaseAuth.instance;
    return Scaffold(
     // appBar:PreferredSize(child: Text("toks"), preferredSize: Size(10, 10)),
      appBar: AppBar(title: Text("Sign up",style: TextStyle(color:Colors.blue)),),
      body:Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: FormKey,
          //Registration forms and button to sign up
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Enter your e-mail ",style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.white),),
                    SizedBox(height: 15,),
                    TextFormField(
                      validator: (val){
                        if(val==null || val.isEmpty==true){
                          return "please your e-mail";
                        }
                      },
                      controller: Emialcontrollar,
                      decoration: InputDecoration(
                          border: OutlineInputBorder()
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                  Text("Enter the password",style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.white)),
                    SizedBox(height: 15,),
                  TextFormField(
                    validator: (val){
                      if(val==null || val.isEmpty==true){
                        return "Please enter the password";
                      }
                    },
                    controller:passwordcontoller,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder()
                    ),
                  ),
                ],),
                SizedBox(height: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Enter the university",style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.white)),
                    SizedBox(height: 15,),
                    TextFormField(
                    controller:universityController,
                    validator: (val){
                      if(val==null || val.isEmpty==true){
                        return "plase enter your university";
                      }
                    },
                      onFieldSubmitted: (String value) {
                        print(value);
                      },
                    decoration: InputDecoration(
                        border: OutlineInputBorder()
                    ),
                  ),

                ],),
                SizedBox(height: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                  Text("Enter the phone Number",style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.white)),
                    SizedBox(height: 15,),
                    TextFormField(
                      validator: (val){
                        if(val==null || val.isEmpty==true){
                          return "please enter the phone Number";
                        }
                    },
                    controller:phomnenumbercontroller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                        )
                    ),
                  ),
                ],),
                SizedBox(height: 20,),
                MaterialButton(
                  minWidth: double.infinity,
                    color: Colors.blue,
                    shape: Border.symmetric(),
                    onPressed: ()async {
                      if(FormKey.currentState!.validate()==true){
                        await fir_obj.createUserWithEmailAndPassword(email:Emialcontrollar.text.toString(),
                            password: passwordcontoller.text.toString()).then((value) {Navigator.pop(context);})
                            .catchError((eror){print(eror);});
                        print(Emialcontrollar.text);
                        print(passwordcontoller.text);
                      }
                    },
                    child: Text("Register now >>>",style:TextStyle(fontSize: 25,fontWeight:FontWeight.bold,color: Colors.white),)),
              ],
            ),
          ),
        ),
      ),
    );}}