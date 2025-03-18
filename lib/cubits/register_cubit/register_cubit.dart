import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  Future<void> registerUser(
      {required String email, required String password}) async {
    emit(RegisterLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (ex) {
      if(ex.code == 'email-already-in-use') {
        emit(RegisterFailure('The account already exists for that email.'));
      } else if (ex.code == 'weak-password') {
        emit(RegisterFailure('The password provided is too weak.'));
      }
    } catch (e) {
      emit(RegisterFailure('There was an error'));
    }
  }
}
