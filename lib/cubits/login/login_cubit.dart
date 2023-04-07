import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helpers/constants.dart';
import '../../helpers/dio_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoading());
    DioHelper.postData(url: login, data: {
      'email': email,
      'password': password,
    })
        .then((value) => emit(LoginSuccess()))
        .catchError((error) => emit(LoginError(error.toString())));
  }

  void changePassword() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginPassword());
  }
}
