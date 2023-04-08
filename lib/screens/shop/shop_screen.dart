import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/helpers/cashe_helper.dart';

import '../../helpers/app_router.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
      ),
      body: TextButton(
        onPressed: () {
          CasheHelper.removeData('token')
              .then((value) => GoRouter.of(context).pushReplacement(
                    AppRouter.loginScreen,
                  ));
        },
        child: const Text('Sign Out'),
      ),
    );
  }
}
