import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/cubit.dart';
import 'cubits/shop/shop_cubit.dart';
import 'cubits/states.dart';
import 'helpers/app_router.dart';
import 'helpers/bloc_observer.dart';
import 'helpers/cashe_helper.dart';
import 'helpers/dio_helper.dart';
import 'styles/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CasheHelper.init();
  // bool? isDark = CasheHelper.getData('isDark');
  // bool? onBoarding = CasheHelper.getData('onBoarding');
  Bloc.observer = MyBlocObserver();
  runApp(const ShopApp());
}

class ShopApp extends StatelessWidget {
  const ShopApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()
            //..changeAppMode(sharedDark: isDark),
            ),
        BlocProvider(create: (context) => ShopCubit()..getHomeData()),
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
