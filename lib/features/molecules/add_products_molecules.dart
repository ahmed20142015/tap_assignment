import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tap_assignment/features/atoms/button_atom.dart';

import '../../data/sharedpref/preferences.dart';
import '../../main.dart';
import '../atoms/text_form_field_atom.dart';
import '../pages/data/model/products.dart';
import '../pages/view_model/products_view_model.dart';

class AddProductsMolecules extends StatelessWidget{
  static final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String productName='';
  String productDesc='';
  String productPrice='';


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Form(
      key: _key,
      child: ListView(
        shrinkWrap: true,
        children: [
          TextFormFieldAtom(
            hint: 'Product Name',
            onChanged: (txt){},
            onSaved: (txt){productName = txt!;},
            inputType: TextInputType.text,
            validator: (value) {
              return value == null || value.length>=3  ? null : 'Product name required';
            },
          ),
          SizedBox(height: 10.h,),
          TextFormFieldAtom(
            hint: 'Product Description',
            onChanged: (txt){},
            onSaved: (txt){productDesc = txt!;},
            inputType: TextInputType.text,
            validator: (value) {
              return value == null || value.length>=3  ? null : 'Product description required';
            },
          ),
          SizedBox(height: 10.h,),
          TextFormFieldAtom(
            hint: 'Product Price',
            onChanged: (txt){},
            onSaved: (txt){productPrice = txt!;},
            inputType: TextInputType.number,
            validator: (value) {
              return value == null ||( value.length>0 && value != '.' )? null : 'Product price required';
            },
            inputFormatters: [
              FilteringTextInputFormatter.deny(' '),
              FilteringTextInputFormatter.deny(','),
              FilteringTextInputFormatter.deny('-'),
            ],
            suffixText: 'K.D',
          ),
          SizedBox(height: 20.r,),
          ButtonAtom(
            callback: ()async{
              FocusManager.instance.primaryFocus?.unfocus();
              if ((_key.currentState?.validate() ?? false)) {
                _key.currentState?.save() ;
                await context
                    .read(sharedPreferencesHelper)
                    .putObjectList(Preferences.products, [
                  ProductItem(
                      productId:0,
                      name: productName,
                      desc: productDesc,
                      price: productPrice+' K.D'
                  ),
                  ...context
                      .read(sharedPreferencesHelper)
                      .getObjectList<ProductItem>(Preferences.products,
                          (map) => ProductItem.fromJson(map)),

                ]);
                context.read(productsListProvider).refresh();
                productName='';
                productDesc='';
                productPrice='';

                Navigator.of(context).pop();
                Flushbar(
                  flushbarPosition: FlushbarPosition.TOP,
                  duration: const Duration(seconds: 3),
                  title: '',
                  backgroundColor: Theme.of(context).cardColor,
                  messageText: const Text("Product has been added successfully"),
                ).show(context);
              }
            },
            title: 'Submit'
          ),
        ],
      ),
    );
  }


}