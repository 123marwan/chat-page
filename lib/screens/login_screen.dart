import 'package:chatapp/screens/register_screen.dart';
import 'package:chatapp/widget/custom_button.dart';
import 'package:chatapp/widget/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../const/const.dart';
import '../helper/show_snake_bar.dart';

class login extends StatefulWidget {
  login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  String? email;
  String? password;

  GlobalKey<FormState> formkey = GlobalKey();

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: Kprimarycolor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 80),
                  Center(child: Image.asset('assets/images/scholar.png')),
                  Text(
                    'scholar chat',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Text(
                        'login',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  customtextfield(
                    hinttext: 'Email',
                    onchange: (data) {
                      email = data;
                    },
                  ),
                  SizedBox(height: 20),
                  customtextfield(
                    obscur: true,
                    hinttext: 'Password',
                    onchange: (data) {
                      password = data;
                    },
                  ),
                  SizedBox(height: 20),
                  custombutton(
                    ontab: () async {
                      if (formkey.currentState!.validate()) {
                        setState(() {
                          isloading = true;
                        });
                        try {
                          await loginuser();

                          Navigator.pushNamed(context, 'chatpage',arguments:email );

                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            showsnakbars(context, 'User not found');
                          } else if (e.code == 'User not found') {
                            showsnakbars(context, 'Wrong password');
                          } else {
                            showsnakbars(context, 'An error occurred');
                          }


                        }
                        catch(e)
                        {
                          print(e);
                          showsnakbars(context, 'there was an error');
                        }
                        setState(() {
                          isloading = false;
                        });
                      }
                    },
                    tile: 'login',
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'register');
                        },
                        child: Text(
                          ' Register',
                          style: TextStyle(color: Color(0xffC7EDE6)),
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
  }

  Future<void> loginuser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }


}