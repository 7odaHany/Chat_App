import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat/cubits/chat_cubit/chat_cubit.dart';
import 'package:scholar_chat/cubits/login_cubit/login_cubit.dart';
import 'package:scholar_chat/cubits/register_cubit/register_cubit.dart';
import 'package:scholar_chat/firebase_options.dart';
import 'package:scholar_chat/screens/chat_screen.dart';
import 'package:scholar_chat/screens/login_screen.dart';
import 'package:scholar_chat/screens/register_screen.dart';
import 'package:scholar_chat/screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ScholarChats());
}

class ScholarChats extends StatelessWidget {
  const ScholarChats({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => ChatCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          RegisterScreen.id: (context) => RegisterScreen(),
          ChatScreen.id: (context) => ChatScreen(),
          WelcomeScreen.id: (context) => const WelcomeScreen(),
        },
        initialRoute: 'WelcomeScreen',
      ),
    );
  }
}
