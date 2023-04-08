import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helpers/constants.dart';
import '../../helpers/dio_helper.dart';
import '../../models/home_model/home_model.dart';
import '../../screens/shop/categories_screen.dart';
import '../../screens/shop/favorites_screen.dart';
import '../../screens/shop/products_screen.dart';
import '../../screens/shop/settings_screen.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopInitial());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.category_sharp),
      label: 'Categories',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Favorites',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];

  List<Widget> screens = [
    const ProductsScreen(),
    const CategoriesScreen(),
    const FavoritesScreen(),
    const SettingsScreen(),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNav());
  }

  HomeModel? homeModel;

  void getHomeData() {
    emit(ShopLoadingHome());
    DioHelper.getData(
      url: home,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      emit(ShopSuccessHome());
    }).catchError((error) {
      emit(ShopErrorHome());
    });
  }
}
