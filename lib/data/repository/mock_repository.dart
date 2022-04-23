import 'dart:convert';
import 'package:flutter/services.dart';

import '../../features/pages/data/model/products.dart';


class MockRepository{
  Future<List<ProductItem>> getMockProducts()async{
    try {
      String response = await rootBundle.loadString('assets/json/products.json');
      Products result = Products.fromJson(json.decode(response));
      return result.products!.toList();
    } catch (e) {
     return [];
    }
  }

}