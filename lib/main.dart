import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/cubit.dart';
import 'cubits/states.dart';
import 'helpers/app_router.dart';
import 'styles/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // DioHelper.init();
  // await CasheHelper.init();
  // bool? isDark = CasheHelper.getData('isDark');
  runApp(const ShopApp());
}

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()
            //..changeAppMode(sharedDark: isDark),
            ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        builder: (context, state) => MaterialApp.router(
          routerConfig: AppRouter.router,
          title: 'Shop App',
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode:
              AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
        ),
        listener: (context, state) {},
      ),
    );
  }
}