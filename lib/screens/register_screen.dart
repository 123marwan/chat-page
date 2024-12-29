import 'package:chatapp/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../const/const.dart';
import '../helper/show_snake_bar.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text_field.dart';

class register extends StatefulWidget {
  register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
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
                        'Register',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  customtextfield(
                    onchange: (data) {
                      email = data;
                    },
                    hinttext: 'Email',
                  ),
                  SizedBox(height: 20),
                  customtextfield(
                    onchange: (data) {
                      password = data;
                    },
                    hinttext: 'Password',
                  ),
                  SizedBox(height: 20),
                  custombutton(
                    ontab: () async {
                      if (formkey.currentState!.validate()) {
                        setState(() {
                          isloading = true;
                        });
                        try {
                          await registeruser();

                         Navigator.pushNamed(context, 'chatpage');
                          showsnakbars(context, 'sucess');
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            showsnakbars(context, 'Weak password');
                          } else if (e.code == 'email-already-in-use') {
                            showsnakbars(context, 'Email already in use');
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
                    tile: 'Register',
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          ' Login',
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

  Future<void> registeruser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }


  }