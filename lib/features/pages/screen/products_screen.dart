import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../atoms/product_item_atom.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_routes.dart';
import '../../atoms/appbar_atom.dart';
import '../../atoms/button_atom.dart';
import '../../atoms/text_form_field_atom.dart';
import '../view_model/products_view_model.dart';
import '../view_model/theme_view_model.dart';

class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final products = watch(productsListProvider).searchResult;

    final appTheme = watch(appThemeProvider);
    return Scaffold(
        appBar: AppBarAtom(title: 'Manage Products',leading: InkWell(
            onTap: () {
              appTheme.changeTheme();
            },
            child: const Icon(Icons.brightness_2_outlined)),),
        floatingActionButton: (MediaQuery.of(context).viewInsets.bottom > 0.0)
            ? Container()
            : ButtonAtom(title:'Add Product',callback:(){
          Navigator.pushNamed(context, AppRoutes.addProduct);
        } ,margin: 20,),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Container(
          padding: EdgeInsets.all(16).r,
          margin: EdgeInsets.only(bottom: 50).r,
          width: double.infinity,
          height: double.infinity,
          child: ListView(
            shrinkWrap: true,
            children: [
              TextFormFieldAtom(
                hint: 'Search Products',
                onChanged: (txt) {
                  print(txt);
                  watch(productsListProvider).filterList(txt!);
                },onSaved: (txt) {},
                inputType: TextInputType.text,
                icon: Icon(
                  Icons.search,
                  color: AppColor.mainTextColor,
                  size: 20.r,
                ),
              ),
              Column(
                children: products
                    .map((item) => ProductItemAtom(
                          productItem: item,
                        ))
                    .toList(),
              )
            ],
          ),
        ));
  }
}
