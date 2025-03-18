import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(Loginsuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure('No user found for that email.' as Exception));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(
            'Wrong password provided for that user.' as Exception));
      }
    } catch (e) {
      emit(LoginFailure('something went wrong' as Exception));
    }
  }
}
