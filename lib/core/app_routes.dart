import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tap_assignment/features/pages/screen/add_product_screen.dart';
import '../features/pages/screen/products_screen.dart';


abstract class AppRoutes {
  static const main = '/';
  static const addProduct = '/add-product';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
        settings: settings,
        builder: (_) {
          switch (settings.name) {
            case main:
              return const ProductsScreen();
            case addProduct:
              return  AddProductScreen();
            default:
              return const ProductsScreen();
          }
        });
  }
}
