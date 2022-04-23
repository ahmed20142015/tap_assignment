import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tap_assignment/features/pages/data/model/products.dart';

class ProductItemAtom extends StatelessWidget {
  const ProductItemAtom({required this.productItem, Key? key})
      : super(key: key);
  final ProductItem productItem;

  @override
  Widget build(BuildContext context) {
    return Container(

      width: double.infinity,
      margin: EdgeInsets.only(top: 10).r,
      padding: EdgeInsets.all(12).r,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).cardColor
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(productItem.name!,style: Theme.of(context).textTheme.headline1,),
          SizedBox(height: 5.r,),
          Text(productItem.desc!,style: Theme.of(context).textTheme.headline2,),
          SizedBox(height: 5.r,),
          Text(productItem.price!,style: TextStyle(color: Colors.red,fontSize: 14,fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
