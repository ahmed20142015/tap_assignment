import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tap_assignment/features/pages/data/model/products.dart';

import '../../../data/sharedpref/preferences.dart';
import '../../../main.dart';



// final productsListProvider = FutureProvider((ref) {
//   return ref.read(mockRepository).getMockProducts();
// });




final productsListProvider = ChangeNotifierProvider((ref) {
  return ProductsList(ref);
});

class ProductsList extends ChangeNotifier {
  List<dynamic> list = [];
  List<dynamic> searchResult = [];
  ProviderReference ref;

  ProductsList(this.ref) {
    refresh();
  }

  void refresh() async{
    list = ref
        .read(sharedPreferencesHelper)
        .getObjectList(Preferences.products, (v) => ProductItem.fromJson(v));
    if (list.isEmpty) {
      List<ProductItem> localList  = await ref.read(mockRepository).getMockProducts();
       ref.read(sharedPreferencesHelper)
          .putObjectList(
          Preferences.products, localList);
      list = localList;
    }
    searchResult = list;
    notifyListeners();

  }

  filterList(String txt){
    if (txt.isNotEmpty) {
      searchResult = list.where((element) => (element.name!.toLowerCase().contains(txt.toLowerCase()) ||
          element.desc!.toLowerCase().contains(txt) || element.price!.toLowerCase().contains(txt.toLowerCase()))).toList();
    }
    else{
      searchResult = list;
    }


    notifyListeners();
  }

}