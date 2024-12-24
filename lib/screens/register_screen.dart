import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/helper/show_snack_bar.dart';
import 'package:scholar_chat/screens/chat_screen.dart';
import 'package:scholar_chat/widgets/custom_buton.dart';
import 'package:scholar_chat/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);
  static String id = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email, password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Container(
          height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          kPrimaryColor,
          Color.fromARGB(255, 31, 57, 109),
        ])),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: formKey,
              child: ListView(
                children: <Widget>[
                  const SizedBox(height: 75),
                  Image.asset(
                    'assets/images/scholar.png',
                    height: 120,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Scholar Chats',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontFamily: 'pacifico',
                          )),
                    ],
                  ),
                  const SizedBox(height: 75),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                    child: Row(
                      children: [
                        Text('REGISTER',
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                  CustomFormTextField(
                    onChanged: (value) {
                      email = value;
                    },
                    hintText: 'Email',
                  ),
                  const SizedBox(height: 8),
                  CustomFormTextField(
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                    },
                    hintText: 'Password',
                  ),
                  const SizedBox(height: 30),
                  CustomButon(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await registerUser();
                          showSnackBar(context, 'User registered successfully');
                          Navigator.pushNamed(
                            context,
                            ChatScreen.id,
                            arguments: email,
                          );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'email-already-in-use') {
                            showSnackBar(context,
                                'The account already exists for that email.');
                          } else if (e.code == 'weak-password') {
                            showSnackBar(
                                context, 'The password provided is too weak.');
                          }
                        } catch (e) {
                          showSnackBar(context, "there was an error");
                        }
                      }
                      isLoading = false;
                      setState(() {});
                    },
                    text: 'Register',
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?',
                          style: TextStyle(color: Colors.white)),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Login',
                            style: TextStyle(color: Color(0xffC7EDe6))),
                      )
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

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
