import 'package:flutter/material.dart';

import '../models/home_model/home_model.dart';
import 'product_grid_item.dart';
import 'product_slider.dart';

class ProductGrid extends StatelessWidget {
  final HomeModel homeModel;
  const ProductGrid({
    Key? key,
    required this.homeModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          ProductSlider(homeModel: homeModel),
          const SizedBox(height: 10),
          Container(
            color: Colors.grey[300],
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              childAspectRatio: 1 / 1.56,
              children: List.generate(
                homeModel.data!.products!.length,
                (index) =>
                    ProductGridItem(product: homeModel.data!.products![index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
