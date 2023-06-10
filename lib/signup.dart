
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

import "package:maths_admin_maths/authenticate.dart";

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // var collection = FirebaseFirestore.instance.collection("user");
  TextEditingController Username = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController password = TextEditingController();

  /* @override
  buildcard(Name,Email) async{
    collection.add({
      "name":Name.text,
      "Email":Email.text,
    });
  }*/
  final formKey = GlobalKey<FormState>();

  void signUp() async {
    if (formKey.currentState!.validate()) {
      await Authenticate(FirebaseAuth.instance).signUpWithEmail(
        name: Username.text,
        email: Email.text,
        password: password.text,
        context: context,

      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp"),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Center(child: Container(
                    child: Column(children: [
                      SizedBox(height: 130),
                      TextFormField(
                        controller: Username,
                        validator: (val) {
                          return val
                              .toString()
                              .isEmpty || val
                              .toString()
                              .length < 2 ? "Username must be valid" : null;
                        },
                        decoration: InputDecoration(
                            hintText: "Username",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                        ),
                      ),
                      SizedBox(height: 14),
                      TextField(
                        controller: Email,
                        decoration: InputDecoration(
                            hintText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                        ),
                      ),
                      SizedBox(height: 14),
                      TextField(
                        controller: password,
                        decoration: InputDecoration(
                            hintText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                        ),

                      ),

                      SizedBox(height: 14),
                      GestureDetector(
                        onTap: signUp,
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.orangeAccent,
                          ),


                          child: Center(child: Text("SignUp", style: TextStyle(
                              color: Colors.white
                          ),),),),

                      ),
                      SizedBox(height: 14),
                      TextButton(child: Container(
                        width: double.infinity,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height / 12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.pinkAccent,
                        ),


                        child: Center(
                          child: Text("Sign Up with Google", style: TextStyle(
                              color: Colors.white
                          ),),),),
                        onPressed: () {
                          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
                        },
                      ),
                      SizedBox(height: 14),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an Account?", style: TextStyle(
                                fontSize: 17
                            ),),
                            TextButton(onPressed: () {
                              //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignIn()));
                            }, child: Text("LogIn", style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 17
                            )),),

                          ]
                      ),

                    ],

                    ),
                  ),
                  ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



