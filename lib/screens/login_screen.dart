import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/helper/show_snack_bar.dart';
import 'package:scholar_chat/screens/chat_screen.dart';
import 'package:scholar_chat/screens/register_screen.dart';
import 'package:scholar_chat/widgets/custom_buton.dart';
import 'package:scholar_chat/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  static String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                    kLogoPath,
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
                        Text('LOGIN',
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
                          // login user
                          await loginUser();
                          Navigator.pushNamed(context, ChatScreen.id, arguments: email);
                        } on FirebaseAuthException catch (e) {
                          showSnackBar(context, 'Email or password is incorrect');
                        } catch (e) {
                          showSnackBar(context, 'An error occurred');
                        }
                        
                        isLoading = false;
                        setState(() {});
                      }
                    },
                    text: 'Login',
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?',
                          style: TextStyle(color: Colors.white)),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RegisterScreen.id,
                          );
                        },
                        child: const Text('Sign Up',
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

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
