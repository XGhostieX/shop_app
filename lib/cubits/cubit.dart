import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  // void changeAppMode({bool? sharedDark}) {
  //   if (sharedDark != null) {
  //     isDark = sharedDark;
  //     emit(AppChangeModeState());
  //   } else {
  //     isDark = !isDark;
  //     CasheHelper.setData("isDark", isDark).then(
  //       (value) => emit(AppChangeModeState()),
  //     );
  //   }
  // }
}
