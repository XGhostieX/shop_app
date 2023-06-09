import 'package:equatable/equatable.dart';

import 'banner.dart';
import 'product.dart';

class Data extends Equatable {
  final List<Banner>? banners;
  final List<Product>? products;
  final String? ad;

  const Data({this.banners, this.products, this.ad});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        banners: (json['banners'] as List<dynamic>?)
            ?.map((e) => Banner.fromJson(e as Map<String, dynamic>))
            .toList(),
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
        ad: json['ad'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'banners': banners?.map((e) => e.toJson()).toList(),
        'products': products?.map((e) => e.toJson()).toList(),
        'ad': ad,
      };

  @override
  List<Object?> get props => [banners, products, ad];
}
