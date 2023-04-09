import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../models/home_model/home_model.dart';

class ProductSlider extends StatelessWidget {
  final HomeModel homeModel;
  const ProductSlider({
    Key? key,
    required this.homeModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: homeModel.data!.banners!
          .map(
            (e) => CachedNetworkImage(
              imageUrl: e.image ??
                  'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
              width: double.infinity,
              fit: BoxFit.cover,
              // placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          )
          .toList(),
      options: CarouselOptions(
        height: 250,
        initialPage: 0,
        viewportFraction: 1,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(seconds: 1),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
