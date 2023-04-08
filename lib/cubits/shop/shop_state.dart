part of 'shop_cubit.dart';

abstract class ShopState {
  const ShopState();

  List<Object> get props => [];
}

class ShopInitial extends ShopState {}

class ShopChangeBottomNav extends ShopState {}

class ShopLoadingHome extends ShopState {}

class ShopSuccessHome extends ShopState {}

class ShopErrorHome extends ShopState {}
