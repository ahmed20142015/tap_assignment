import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tap_assignment/features/atoms/appbar_atom.dart';
import '../../molecules/add_products_molecules.dart';

class AddProductScreen extends  StatelessWidget {
 const AddProductScreen({Key? key}) : super(key: key);

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: const AppBarAtom(title: 'Add Product'),

    body: Container(
      padding: const EdgeInsets.all(16).r,
      width: double.infinity,
      height: double.infinity,
      child:AddProductsMolecules()
    )
  );
}
}
