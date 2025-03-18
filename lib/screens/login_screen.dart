import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/cubits/chat_cubit/chat_cubit.dart';
import 'package:scholar_chat/cubits/login_cubit/login_cubit.dart';
import 'package:scholar_chat/helper/show_snack_bar.dart';
import 'package:scholar_chat/screens/chat_screen.dart';
import 'package:scholar_chat/screens/register_screen.dart';
import 'package:scholar_chat/widgets/custom_buton.dart';
import 'package:scholar_chat/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static String id = 'LoginScreen';

  String? email, password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is Loginsuccess) {
          isLoading = false;
          BlocProvider.of<ChatCubit>(context).getMessages();
          Navigator.pushNamed(context, ChatScreen.id, arguments: email);
        } else if (state is LoginFailure) {
          isLoading = false;
          showSnackBar(context, state.e.toString());
        }
      },
      child: ModalProgressHUD(
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
                          await BlocProvider.of<LoginCubit>(context)
                              .loginUser(email: email!, password: password!);
                              
                        } else {}
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
      ),
    );
  }
}
